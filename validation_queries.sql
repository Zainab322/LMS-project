USE healthbridge_hospital;

SELECT COUNT(*) AS migrated_rows
FROM appointments_refactored;

SELECT COUNT(*) AS null_dates
FROM appointments_refactored
WHERE appt_datetime IS NULL;

SELECT DISTINCT status
FROM appointments_refactored;

SELECT COUNT(*) AS orphans
FROM appointments_refactored a
LEFT JOIN patients p
ON a.patient_id = p.patient_id
WHERE p.patient_id IS NULL;