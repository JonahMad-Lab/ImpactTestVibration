# ImpactTestVibration
This MATLAB script is designed to process and analyze Frequency Response Function (FRF) data from multiple datasets, plot the responses, and extract key information such as the maximum amplitudes and their corresponding frequencies within a specified range.

## Features
1. **Data Loading**: Automatically loads FRF data from `.mat` files for multiple responses (e.g., X, Y, Z directions).
2. **Frequency Calculation**: Calculates accurate frequency values based on the starting value, increment, and number of points provided in the datasets.
3. **Magnitude Computation**: Computes the magnitude of the responses from the provided datasets.
4. **Visualization**: Generates semilogarithmic plots (`semilogy`) to visualize FRF data for different datasets.
5. **Maximum Value Extraction**: Identifies the maximum amplitude within the frequency range of 0 to 100 Hz for each response and records the corresponding frequency.
6. **CSV Export**: Saves the maximum amplitudes and their associated frequencies into a `.csv` file for further analysis.

## File Structure
- **Input Data**: The script expects `.mat` files containing the FRF data for multiple responses. Each file should have the following fields:
  - `FRF.x_values.start_value`: Starting frequency value.
  - `FRF.x_values.increment`: Frequency increment value.
  - `FRF.x_values.number_of_values`: Total number of frequency points.
  - `FRF.y_values.values`: Response data (e.g., acceleration).
- **Output File**: A CSV file named `MaxValues_UpTo100Hz_withFrequencies.csv` containing the maximum amplitudes and their corresponding frequencies for each response.

## Usage
1. Place the `.mat` files containing the FRF data in the working directory.
2. Run the script in MATLAB.
3. The script will:
   - Load the data from each `.mat` file.
   - Compute the magnitude of the responses.
   - Plot the FRF data for visualization.
   - Extract and save the maximum amplitude and frequency for each response (up to 100 Hz) into a CSV file.

## Example Plots
- **FRF Visualization**: The script generates semilogarithmic plots (`semilogy`) with proper axis labels and legends. Example:
  - Title: `PLA4 Impact FRF`
  - X-axis: Frequency (Hz)
  - Y-axis: Amplitude (g/N)
  - Limits:
    - `xlim([0 200])`: Frequency range
    - `ylim([10^-2 10^2])`: Amplitude range
![alt text](https://github.com/JonahMad-Lab/ImpactTestVibration/blob/main/PLA4.png?raw=true)

## CSV Output Format
| Response_ID | Frequency_at_Max_Amplitude_Hz | Max_Amplitude_g_N |
|-------------|-------------------------------|-------------------|
| 1           | 75                            | 123.45            |
| 2           | 50                            | 234.56            |
| ...         | ...                           | ...               |

## Notes
- Ensure the `.mat` files are formatted correctly with the required fields.
- The frequency limits for analysis (0 to 100 Hz) can be adjusted in the script.
- The y-axis limits for plots can be customized using `ylim([10^-2 10^2])`.
- If discrepancies occur between calculated and visual peak values, verify the resolution of frequency data extracted from the `.mat` files.

## Requirements
- MATLAB R2020a or later (for compatibility with the `semilogy` function and table writing).
- Input `.mat` files with properly structured FRF data.

## Contact
For questions or issues, please contact the author of the script.

