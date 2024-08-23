## Stream from a Network Media Source to YouTube

### Requirements
- **[Restreamer by Datarhei](https://github.com/datarhei/restreamer)**
- **[FFmpeg](https://www.ffmpeg.org/)**

### Methods

#### Method 1: Using PowerShell Script

1. **Obtain a Streamlink:**
   - Ensure you have a valid streamlink file (e.g., `.m3u8`, `.ts`).

2. **Configure Restreamer:**
   - Set up Restreamer to handle the streamlink. Follow the [Restreamer Setup Guide](https://docs.datarhei.com/restreamer/knowledge-base/manual/wizard) for detailed instructions.

3. **Prepare Your Environment:**
   - Download the source code of this repository.
   - Set the `batchFileDirectory` directory in `config.txt`.

4. **Run the PowerShell Script:**
   - Open PowerShell.
   - Drag and drop the `.ps1` file into the PowerShell window and press Enter.

5. **Choose Log File Option:**
   - Select either option 1 or 2 based on your preference:
     - **1:** Create a new log file.
     - **2:** Append to an existing log file.

6. **Input Streaming Information:**
   - After choosing your log file option, you’ll be prompted to:
     - Paste the HLS link of the Restreamer source and press Enter.
     - Enter the YouTube stream key and press Enter.

   This method logs the output of the batch file execution and provides more control over logging and execution.

#### Method 2: Using Batch File Directly(simpler)

1. **Obtain a Streamlink:**
   - Ensure you have a valid streamlink file (e.g., `.m3u8`, `.ts`).

2. **Configure Restreamer:**
   - Set up Restreamer to handle the streamlink. Follow the [Restreamer Setup Guide](https://docs.datarhei.com/restreamer/knowledge-base/manual/wizard) for detailed instructions.

3. **Prepare Your Environment:**
   - Download the source code of this repository.

4. **Run the Batch File:**
   - Simply double-click the `restream.bat` file to execute it.

5. **Input Streaming Information:**
   - You will be prompted to:
     - Paste the HLS link of the Restreamer source and press Enter.
     - Enter the YouTube stream key and press Enter.

   This method is simpler and executes the batch file directly without additional logging.

Follow these steps for the method that best fits your needs. For additional assistance, refer to the Restreamer documentation and FFmpeg resources.
