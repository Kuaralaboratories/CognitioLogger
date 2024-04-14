# CognitioLogger

CognitioLogger is a versatile logging library written in Lua, developed by Kuara Laboratories. It offers comprehensive logging capabilities with customizable features to suit various logging requirements. Let's delve into the details of its features, configuration options, and usage guidelines.

## Features:

1. **Flexible Notification Classes:**
   - CognitioLogger provides support for 7 distinct notification classes, namely Error, Fail, Glitch, Defect, Fault, Anomaly, and Info. Additionally, there's a Default class for messages without a specific class.
   - Each notification class is associated with a unique color for easy identification and differentiation of log messages.

2. **Terminal Output:**
   - Log messages are printed to the terminal/console, facilitating real-time monitoring and debugging.
   - The terminal output includes essential information such as the notification class, timestamp, source file, line number, and the logged message itself.

3. **File Logging:**
   - CognitioLogger allows logging messages to a designated log file, enabling persistent storage and analysis of log data.
   - Log entries in the file consist of the notification class, timestamp, source file, line number, and the logged message, providing comprehensive logging information.

4. **Customization:**
   - Users have the flexibility to customize the behavior of CognitioLogger through configurable options.
   - Configuration parameters include the ability to enable/disable colored output in the terminal (`usecolor`), specify the path to the log file (`outfile`), and set the minimum log level (`level`).

## Usage:

### Basic Logging:
```lua
local cognitiolog = require("cognitiolog")

-- Example usage
cognitiolog.Error("An error occurred!")  -- Logs an error message
cognitiolog.Info("Informational message.") -- Logs an informational message
```

### Advanced Configuration:
```lua
cognitiolog.usecolor = true  -- Enable colored output in terminal
cognitiolog.outfile = "log.txt"  -- Log to a file named "log.txt"
cognitiolog.level = "Info"  -- Set the minimum log level to Info

cognitiolog.Error("An error occurred!")  -- Logs to terminal and file
cognitiolog.Info("Informational message.") -- Logs only to terminal
```

### Custom Log Configuration:
```lua
cognitiolog.addCustomLog("MyCustomLogTpye", "\27[35m") -- Log type and color added like this

cognitiolog.MyCustomLogType("MyCustomLog") -- Logs with color you choose and level
```

## Notification Classes:

- **Error:** Critical errors that require immediate attention.
- **Fail:** Failures or unexpected conditions.
- **Glitch:** Minor issues or anomalies.
- **Defect:** Defects or inconsistencies in behavior.
- **Fault:** Faults or malfunctions in functionality.
- **Anomaly:** Unusual or abnormal conditions.
- **Info:** General informational messages.
- **Default:** Messages without a specific notification class.

## Conclusion:

CognitioLogger offers a comprehensive logging solution for Lua applications, empowering developers with robust logging capabilities. Whether it's real-time debugging or long-term analysis of log data, CognitioLogger provides the flexibility and functionality needed to streamline the logging process and enhance application reliability.

For further insights into advanced usage, customization options, and integration with your Lua projects, please refer to the documentation provided by Kuara Laboratories.

Feel free to explore and leverage CognitioLogger to enhance the logging experience in your Lua applications!

If you have any questions or need assistance, don't hesitate to reach out.
