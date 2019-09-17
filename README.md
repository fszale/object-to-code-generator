# object-to-code-generator
This is a generic code generator that utilizes configuration driven software development approach to execute.  The code accepts imput in form of files (i.e.XML defined data objects) and applies XSLT transformation to produce code files (i.e. Python classes, JSON data).


As a universal utility, the inputs, outputs and the converter engines can be quickly swapped out and replaced with variations of conversion logic (XSLT is just one example).


This sample will utilize files in the input folder to produce files in the output folder.  

## How to Run
To execute please run the following command from project root folder:

* python src\\__init__.py

## Configuration
The config\\generator_config.json files contains json metadata that defines sequential tasks and related parameters for execution.

```json
{
    "name": "Code Generator",
    "description": "This config file provides input, parameter and output definitions for code generation tasks.",
    "version": "0.1.0",
    "task_list": [
        {
            "task_name": "your.task.name",
            "implementation": "folder.module_name.class_name",
            "params": {
                "source": {
                    "file_name": "./input_file_path.ext"
                },
                "transformer": {
                    "file_name": "./input_file_path_transform_configuration.ext"
                },
                "output": {
                    "file_name": "./output_file_path.ext"
                }
            }
        },
    ...
    ]
}
```

The source/transformer/output are file paths of your choosing, these parameters are then passed into an instance of the implementation class for interpretation.  You can add parameters as you wish as the "params" section is passed as is to the implementation class.
You can define as many tasks as you like.

## Logging
The utility produces a log as follows:

```text
2019-09-16 21:08:02 INFO     Starting Code Generator v0.1.0 ...
2019-09-16 21:08:02 INFO     Starting transform_data_to_python
2019-09-16 21:08:02 INFO     Ending transform_data_to_python
2019-09-16 21:08:02 INFO     Starting transform_data_to_json
2019-09-16 21:08:02 INFO     Ending transform_data_to_json
2019-09-16 21:08:02 INFO     Done.
```

The messages can be fully customized. 