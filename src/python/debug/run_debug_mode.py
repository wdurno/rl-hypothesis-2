import os
import jinja2
from subprocess import Popen, PIPE

## TODO this is duplicated code in this file. See python/build/util.py. Refactor required. 

## constants 
## text color constants
HEADER = '\033[95m'
OKBLUE = '\033[94m'
OKCYAN = '\033[96m'
OKGREEN = '\033[92m'
WARNING = '\033[93m'
FAIL = '\033[91m'
NC = '\033[0m'
BOLD = '\033[1m'
UNDERLINE = '\033[4m'

repo_dir = os.environ['repo_dir'] 

def run(cmd: str, stdin: str=None):
    'Execute a string as a blocking, exception-raising system call'
    ## verify assumptions
    if type(cmd) != str:
        raise ValueError('`cmd` must be a string!')
    ## execute
    print(OKCYAN+cmd+NC)
    if stdin is None:
        ## no stdin
        proc = Popen(cmd, shell=True, stdout=PIPE, stderr=PIPE)
        exit_code = proc.wait()
        stdout = proc.stdout.read().decode()
        stderr = proc.stderr.read().decode()
    else:
        ## apply stdin
        if type(stdin) not in [str, bytes]:
            raise ValueError('STDIN must be str or bytes!')
        if type(stdin) == str:
            ## convert to bytes
            stdin = stdin.encode()
        proc = Popen(cmd, shell=True, stdout=PIPE, stderr=PIPE, stdin=PIPE)
        stdout, stderr = proc.communicate(stdin)
        stdout = stdout.decode()
        stderr = stderr.decode()
        exit_code = proc.returncode
    if exit_code != 0:
        print(FAIL+'STDOUT: '+stdout+NC)
        print(FAIL+'STDERR: '+stderr+NC)
        raise OSError(exit_code)
    pass

def init_debug():
    ## get job template
    with open(f'{repo_dir}/src/k8s/debug-pod.yaml', 'r') as f:
        pod_template = jinja2.Template(f.read())
    ## get variables for template
    with open(f'{repo_dir}/secret/acr/server') as f:
        docker_server = f.read()
    ai_image_tag = os.environ.get('rl_hypothesis_2_ai_image_tag') 
    ## populate
    pod_yaml = pod_template.render(docker_server=docker_server, ai_image_tag=ai_image_tag)
    ## apply
    cmd = 'kubectl apply -f -'
    stdin = pod_yaml.encode()
    run(cmd, stdin=stdin)
    pass

if __name__ == '__main__':
    init_debug() 

