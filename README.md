## Stream from a Network Media Source to YouTube

### Requirements
- **[Restreamer by Datarhei](https://github.com/datarhei/restreamer)**
- **[FFmpeg](https://www.ffmpeg.org/)**

### Usage Instructions

1. **Obtain a Streamlink:**
   - Ensure you have a valid streamlink file (e.g., `.m3u8`, `.ts`).

2. **Configure Restreamer:**
   - Set up Restreamer to handle the streamlink. Follow the [Restreamer Setup Guide](https://docs.datarhei.com/restreamer/knowledge-base/manual/wizard) for detailed instructions.

3. **Prepare Your Environment:**
   - Download the source code of this repository.
   - Edit the `config.txt` file to specify the path where the `restream.bat` file is located. 

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

Follow these steps to stream from a network media source to YouTube seamlessly. For additional assistance, refer to the Restreamer documentation and FFmpeg resources.
