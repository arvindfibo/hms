# Mock JSON Data for Medplum

This directory contains realistic hospital mock data for seeding Medplum projects with comprehensive, properly linked medical records.

## Overview

The mock data includes:

- **Patients**: 50 realistic patients with proper demographics
- **Practitioners**: 30 doctors and nurses with proper specializations
- **Organizations**: Multiple hospital branches, labs, and pharmacies
- **Encounters**: 200+ properly linked patient encounters
- **Appointments**: Linked to encounters and patients
- **Conditions**: Patient diagnoses and problems properly linked
- **Procedures**: Medical procedures linked to encounters
- **Observations**: Vitals and lab results linked to encounters
- **Diagnostic Reports**: With downloadable PDF attachments
- **Service Requests**: Lab and test orders
- **Medication Requests**: Prescriptions linked to encounters
- **Coverages**: Insurance information for patients

## Generating Data

### Main Script: `generate-realistic-data.js`

This is the primary script that generates all realistic, properly linked hospital data:

```bash
node generate-realistic-data.js
```

This script will:

1. Generate realistic patients with Indian names and demographics
2. Generate practitioners with proper specializations
3. Create encounters linked to patients and practitioners
4. Generate appointments linked to encounters
5. Create conditions (diagnoses) for patients
6. Generate procedures linked to encounters
7. Create observations (vitals and labs) linked to encounters
8. Generate diagnostic reports with downloadable PDF attachments
9. Create service requests and medication requests
10. Generate insurance coverages

All resources are properly linked to create realistic patient and doctor timelines.

### Other Scripts

- `generate-patient-timeline-data.js` - Legacy script for linking existing data
- `generate-missing-resources.js` - Legacy script for creating missing resources
- `generate-varied-data.js` - Legacy script for generating varied test data

**Note**: The main `generate-realistic-data.js` script replaces the need for these legacy scripts. They are kept for backward compatibility.

## Data Structure

All JSON files follow FHIR R4 resource structure:

- `patients.json` - Patient resources
- `practitioners.json` - Doctor and nurse resources
- `organizations.json` - Hospital organizations
- `locations.json` - Physical locations
- `encounters.json` - Patient encounters
- `appointments.json` - Scheduled appointments
- `conditions.json` - Diagnoses and problems
- `procedures.json` - Medical procedures
- `observations.json` - Vitals and lab results
- `diagnosticReports.json` - Lab/test reports with PDF attachments
- `serviceRequests.json` - Test orders
- `medicationRequests.json` - Prescriptions
- `coverages.json` - Insurance information
- `questionnaires.json` - Patient intake forms

## Diagnostic Reports with PDFs

Diagnostic reports include PDF attachments in the `presentedForm` field. The PDFs are base64-encoded and can be downloaded and opened. Each PDF contains:

- Patient name
- Test name
- Date
- Results summary

## Seeding Data into Medplum

To seed this data into a Medplum project:

```bash
npm run seed:mock-data
```

This will import all JSON files in the correct dependency order to ensure all references are valid.

## Data Characteristics

### Realistic Features

- **Proper Linking**: All resources are properly linked (patients → encounters → observations, etc.)
- **Timeline Support**: Data spans the past 2 years to create realistic timelines
- **Human Readable**: All names, addresses, and descriptions are realistic
- **Medical Accuracy**: Uses proper SNOMED, LOINC, and RxNorm codes
- **Downloadable PDFs**: Diagnostic reports include actual PDF files
- **Complete Workflows**: Full patient journey from appointment → encounter → diagnosis → treatment

### Patient Data

- 50 patients with realistic Indian names
- Proper demographics (age, gender, marital status)
- Addresses across major Indian cities
- Phone numbers in Indian format

### Practitioner Data

- 30 practitioners with various specializations:
  - General Practice
  - Cardiology
  - Internal Medicine
  - Pediatrics
  - Orthopedics
  - Dermatology
  - Neurology
  - Oncology
  - Psychiatry
  - Endocrinology
  - Gastroenterology
  - Pulmonology
  - Nursing staff

### Encounter Data

- 2-8 encounters per patient over 2 years
- Mix of ambulatory, inpatient, and emergency encounters
- Properly linked to patients, practitioners, and locations
- Realistic encounter types (consultations, follow-ups, etc.)

### Diagnostic Reports

- 150+ diagnostic reports
- Each includes a downloadable PDF attachment
- Linked to encounters and service requests
- Includes proper conclusions and result observations

## Updating Data

To regenerate all data with fresh realistic values:

```bash
node generate-realistic-data.js
```

This will overwrite all JSON files with new data. Make sure to backup existing data if needed.

## Notes

- All IDs are UUIDs for proper FHIR compliance
- Resources are linked using proper FHIR references
- Dates are realistic and span the past 2 years
- All medical codes use standard terminologies (SNOMED, LOINC, RxNorm)
- PDF attachments are minimal but valid PDFs that can be opened
