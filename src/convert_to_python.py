import logging


class Convert():
    logger = None
    config = None
    task = None

    def __init__(self, logger, task, config):
        self.logger = logger
        self.config = config
        self.task = task
        return

    def process(self):
        self.logger.info('Starting ' + self.task)
        import lxml.etree as ET

        dom = ET.parse(self.config['source']['file_name'])
        xslt = ET.parse(self.config['transformer']['file_name'])
        transform = ET.XSLT(xslt)
        newdom = transform(dom)

        outf = open(self.config['output']['file_name'], "w+")
        outf.write(str(newdom))
        outf.close()

        self.logger.info('Ending ' + self.task)
        return
