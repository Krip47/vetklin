-- Таблица для пациентов (животных)
CREATE TABLE patients (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    species TEXT NOT NULL,
    breed TEXT,
    age INTEGER,
    owner_name TEXT NOT NULL,
    owner_phone TEXT NOT NULL,
    registration_date DATE DEFAULT CURRENT_DATE
);

-- Таблица для врачей
CREATE TABLE doctors (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name TEXT NOT NULL,
    specialization TEXT NOT NULL,
    phone TEXT NOT NULL
);

-- Таблица для записей на прием
CREATE TABLE appointments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    patient_id INTEGER NOT NULL,
    doctor_id INTEGER NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    reason TEXT,
    status TEXT DEFAULT 'scheduled',
    FOREIGN KEY (patient_id) REFERENCES patients (id),
    FOREIGN KEY (doctor_id) REFERENCES doctors (id)
);

-- Таблица для медицинских карточек
CREATE TABLE medical_records (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    patient_id INTEGER NOT NULL,
    appointment_id INTEGER,
    diagnosis TEXT NOT NULL,
    treatment TEXT,
    prescription TEXT,
    notes TEXT,
    record_date DATE NOT NULL,
    doctor_id INTEGER NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients (id),
    FOREIGN KEY (appointment_id) REFERENCES appointments (id),
    FOREIGN KEY (doctor_id) REFERENCES doctors (id)
);