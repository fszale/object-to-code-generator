import logging
import json
import importlib
import sys,os
sys.path.append(os.getcwd())

if __name__ == '__main__':

    logger = None

    config = json.load(open('./config/generator_config.json'))
    logging.basicConfig(format='%(asctime)s %(levelname)-8s %(message)s',
                        level=logging.INFO,
                        datefmt='%Y-%m-%d %H:%M:%S')
    logger = logging.getLogger('engine')
    logger.info('Starting ' + config['name'] + ' v' + config['version'] + ' ...')

    tasks = config['task_list']
    for task in tasks:

        namesarr = task['implementation'].split('.')
        class_name = namesarr[len(namesarr) - 1]
        namesarr.pop()
        module_name = '.'.join(namesarr)

        module = importlib.import_module(module_name)
        class_ = getattr(module, class_name)
        instance = class_(logger, task["task_name"], task['params'])
        instance.process()

    logger.info('Done.')
