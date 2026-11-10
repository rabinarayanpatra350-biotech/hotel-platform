-- properties
INSERT INTO properties (code, name, city, star_rating) VALUES ('MUM-CSB', 'Colaba Sea Breeze', 'Mumbai', 4) ON CONFLICT (code) DO NOTHING;
INSERT INTO properties (code, name, city, star_rating) VALUES ('MUM-BAY', 'Bandra Bay House', 'Mumbai', 4) ON CONFLICT (code) DO NOTHING;
INSERT INTO properties (code, name, city, star_rating) VALUES ('MUM-JUH', 'Juhu Sands', 'Mumbai', 5) ON CONFLICT (code) DO NOTHING;
INSERT INTO properties (code, name, city, star_rating) VALUES ('MUM-POW', 'Powai Lakeview', 'Mumbai', 4) ON CONFLICT (code) DO NOTHING;
INSERT INTO properties (code, name, city, star_rating) VALUES ('MUM-WOR', 'Worli Seaface', 'Mumbai', 5) ON CONFLICT (code) DO NOTHING;
INSERT INTO properties (code, name, city, star_rating) VALUES ('MUM-AND', 'Andheri Grand', 'Mumbai', 3) ON CONFLICT (code) DO NOTHING;
INSERT INTO properties (code, name, city, star_rating) VALUES ('MUM-BOR', 'Borivali Greens', 'Mumbai', 3) ON CONFLICT (code) DO NOTHING;
INSERT INTO properties (code, name, city, star_rating) VALUES ('MUM-DAD', 'Dadar Central', 'Mumbai', 3) ON CONFLICT (code) DO NOTHING;
INSERT INTO properties (code, name, city, star_rating) VALUES ('MUM-MAL', 'Malabar Hill Residency', 'Mumbai', 5) ON CONFLICT (code) DO NOTHING;
INSERT INTO properties (code, name, city, star_rating) VALUES ('MUM-LOW', 'Lower Parel Loft', 'Mumbai', 4) ON CONFLICT (code) DO NOTHING;
INSERT INTO properties (code, name, city, star_rating) VALUES ('MUM-GOR', 'Goregaon Park', 'Mumbai', 3) ON CONFLICT (code) DO NOTHING;
INSERT INTO properties (code, name, city, star_rating) VALUES ('MUM-CHE', 'Chembur Orchid', 'Mumbai', 3) ON CONFLICT (code) DO NOTHING;
INSERT INTO properties (code, name, city, star_rating) VALUES ('MUM-VER', 'Versova Beach House', 'Mumbai', 4) ON CONFLICT (code) DO NOTHING;
INSERT INTO properties (code, name, city, star_rating) VALUES ('MUM-MUL', 'Mulund Comfort', 'Mumbai', 2) ON CONFLICT (code) DO NOTHING;
-- room types
INSERT INTO room_types (code, name, description, max_occupancy, bed_type, base_rate_inr) VALUES ('standard', 'Standard Room', 'Compact room with a queen bed, city view, and workspace.', 2, 'Queen', 4200) ON CONFLICT (code) DO NOTHING;
INSERT INTO room_types (code, name, description, max_occupancy, bed_type, base_rate_inr) VALUES ('deluxe', 'Deluxe Room', 'Larger room with a king bed, seating area and either a city or courtyard view.', 3, 'King', 6800) ON CONFLICT (code) DO NOTHING;
INSERT INTO room_types (code, name, description, max_occupancy, bed_type, base_rate_inr) VALUES ('premier', 'Premier Room', 'Upper-floor room with a sea or skyline view, lounge access and evening canapes.', 3, 'King', 9500) ON CONFLICT (code) DO NOTHING;
INSERT INTO room_types (code, name, description, max_occupancy, bed_type, base_rate_inr) VALUES ('suite', 'Suite', 'Separate living room, dining nook and a private balcony.', 4, 'King + Sofa bed', 16000) ON CONFLICT (code) DO NOTHING;
INSERT INTO room_types (code, name, description, max_occupancy, bed_type, base_rate_inr) VALUES ('family', 'Family Room', 'Two connected sleeping areas, designed for families travelling with children.', 5, 'King + 2 Twin', 7800) ON CONFLICT (code) DO NOTHING;
-- rooms
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10001', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10002', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10003', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10004', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10005', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10006', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10007', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10008', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10009', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10010', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10011', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10012', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10013', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10014', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10015', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10016', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10017', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10018', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10019', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10020', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10021', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10022', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10023', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10024', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10025', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10026', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10027', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10028', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10029', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10030', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10031', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10032', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10033', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10034', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10035', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10036', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10037', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10038', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10039', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10040', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CSB' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10001', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10002', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10003', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10004', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10005', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10006', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10007', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10008', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10009', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10010', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10011', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10012', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10013', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10014', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10015', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10016', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10017', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10018', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10019', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10020', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10021', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10022', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10023', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10024', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10025', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10026', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10027', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10028', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10029', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10030', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10031', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10032', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10033', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10034', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10035', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BAY' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10001', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10002', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10003', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10004', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10005', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10006', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10007', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10008', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10009', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10010', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10011', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10012', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10013', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10014', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10015', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10016', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10017', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10018', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10019', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10020', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10021', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10022', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10023', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10024', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10025', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10026', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10027', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10028', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10029', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10030', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10031', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10032', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10033', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10034', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10035', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10036', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10037', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10038', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10039', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10040', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10041', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10042', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10043', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10044', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10045', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10046', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10047', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10048', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10049', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10050', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10051', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10052', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10053', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10054', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10055', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10056', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10057', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10058', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10059', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10060', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-JUH' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10001', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10002', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10003', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10004', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10005', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10006', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10007', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10008', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10009', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10010', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10011', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10012', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10013', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10014', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10015', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10016', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10017', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10018', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10019', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10020', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10021', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10022', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10023', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10024', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10025', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10026', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10027', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10028', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10029', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10030', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10031', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10032', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10033', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10034', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10035', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10036', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10037', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10038', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10039', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10040', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10041', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10042', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10043', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10044', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10045', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10046', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10047', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10048', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10049', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10050', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10051', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10052', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10053', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10054', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10055', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10056', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10057', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10058', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10059', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10060', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10061', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10062', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10063', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10064', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10065', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-POW' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10001', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10002', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10003', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10004', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10005', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10006', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10007', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10008', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10009', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10010', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10011', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10012', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10013', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10014', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10015', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10016', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10017', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10018', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10019', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10020', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10021', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10022', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10023', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10024', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10025', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10026', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10027', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10028', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10029', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10030', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10031', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10032', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10033', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10034', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10035', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10036', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10037', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10038', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10039', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10040', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10041', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10042', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10043', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10044', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10045', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10046', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10047', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10048', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10049', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10050', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-WOR' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10001', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10002', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10003', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10004', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10005', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10006', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10007', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10008', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10009', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10010', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10011', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10012', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10013', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10014', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10015', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10016', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10017', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10018', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10019', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10020', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10021', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10022', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10023', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10024', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10025', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10026', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10027', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10028', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10029', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10030', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10031', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10032', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10033', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10034', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10035', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10036', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10037', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10038', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10039', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10040', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10041', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10042', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10043', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10044', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10045', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10046', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10047', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10048', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10049', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10050', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10051', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10052', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10053', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10054', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10055', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10056', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10057', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10058', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10059', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10060', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10061', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10062', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10063', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10064', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10065', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10066', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10067', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10068', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10069', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10070', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-AND' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10001', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10002', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10003', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10004', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10005', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10006', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10007', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10008', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10009', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10010', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10011', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10012', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10013', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10014', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10015', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10016', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10017', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10018', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10019', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10020', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10021', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10022', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10023', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10024', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10025', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10026', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10027', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10028', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10029', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10030', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10031', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10032', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10033', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10034', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10035', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10036', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10037', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10038', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10039', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10040', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-BOR' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10001', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10002', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10003', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10004', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10005', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10006', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10007', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10008', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10009', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10010', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10011', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10012', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10013', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10014', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10015', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10016', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10017', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10018', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10019', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10020', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10021', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10022', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10023', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10024', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10025', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10026', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10027', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10028', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10029', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10030', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10031', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10032', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10033', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10034', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10035', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-DAD' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10001', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10002', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10003', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10004', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10005', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10006', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10007', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10008', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10009', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10010', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10011', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10012', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10013', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10014', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10015', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10016', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10017', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10018', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10019', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10020', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10021', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10022', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10023', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10024', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10025', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10026', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10027', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10028', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10029', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10030', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MAL' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10001', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10002', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10003', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10004', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10005', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10006', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10007', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10008', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10009', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10010', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10011', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10012', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10013', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10014', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10015', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10016', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10017', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10018', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10019', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10020', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10021', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10022', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10023', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10024', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10025', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10026', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10027', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10028', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10029', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10030', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10031', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10032', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10033', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10034', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10035', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10036', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10037', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10038', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10039', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10040', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10041', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10042', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10043', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10044', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10045', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-LOW' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10001', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10002', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10003', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10004', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10005', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10006', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10007', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10008', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10009', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10010', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10011', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10012', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10013', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10014', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10015', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10016', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10017', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10018', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10019', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10020', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10021', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10022', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10023', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10024', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10025', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10026', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10027', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10028', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10029', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10030', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10031', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10032', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10033', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10034', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10035', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10036', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10037', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10038', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10039', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10040', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10041', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10042', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10043', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10044', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10045', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10046', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10047', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10048', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10049', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10050', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10051', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10052', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10053', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10054', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10055', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-GOR' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10001', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10002', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10003', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10004', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10005', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10006', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10007', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10008', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10009', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10010', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10011', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10012', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10013', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10014', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10015', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10016', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10017', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10018', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10019', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10020', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10021', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10022', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10023', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10024', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10025', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10026', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10027', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10028', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10029', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10030', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10031', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10032', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10033', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10034', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10035', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10036', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10037', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10038', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10039', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10040', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-CHE' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10001', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10002', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10003', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10004', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10005', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10006', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10007', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10008', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10009', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10010', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10011', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10012', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10013', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10014', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10015', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10016', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10017', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10018', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10019', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10020', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10021', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10022', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10023', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10024', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10025', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10026', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10027', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10028', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10029', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10030', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-VER' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10001', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10002', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10003', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10004', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10005', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10006', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10007', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10008', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10009', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'standard'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10010', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10011', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10012', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10013', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10014', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10015', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10016', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10017', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10018', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'deluxe'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10019', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10020', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10021', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10022', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10023', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10024', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10025', 12, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10026', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10027', 7, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'premier'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10028', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10029', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10030', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10031', 2, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10032', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10033', 4, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10034', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10035', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10036', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'suite'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10037', 10, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10038', 11, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10039', 8, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10040', 9, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10041', 6, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10042', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10043', 5, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10044', 1, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
INSERT INTO rooms (property_id, room_type_id, room_number, floor, is_active)
     SELECT p.id, rt.id, '10045', 3, TRUE
     FROM properties p, room_types rt WHERE p.code = 'MUM-MUL' AND rt.code = 'family'
     ON CONFLICT (property_id, room_number) DO NOTHING;
UPDATE properties p SET total_rooms = COALESCE((SELECT count(*) FROM rooms r WHERE r.property_id = p.id AND r.is_active), 0);
-- guests
INSERT INTO guests (full_name, email, phone, country) VALUES ('Yuki Sharma', 'yuki.sharma49@example.com', '+91 73131 53264', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Rahul Smith', 'rahul.smith11@example.com', '+91 98881 61574', 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('James Chen', 'james.chen5@example.com', '+91 88908 20406', 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Lucas Johnson', 'lucas.johnson35@example.com', '+91 92672 94677', 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Meera Johnson', 'meera.johnson55@example.com', '+91 99181 48251', 'United States') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Nikhil Kapoor', 'nikhil.kapoor67@example.com', '+91 93391 50649', 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Sarah Gupta', 'sarah.gupta14@example.com', '+91 77704 11462', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Sneha Iyer', 'sneha.iyer88@example.com', '+91 85895 78757', 'Japan') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Vikram Kapoor', 'vikram.kapoor10@example.com', '+91 76305 51132', 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Rahul Gupta', 'rahul.gupta38@example.com', '+91 75944 48413', 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Divya Bose', 'divya.bose14@example.com', '+91 96737 88425', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Pooja Iyer', 'pooja.iyer60@example.com', '+91 84278 68514', 'UAE') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Lucas Patel', 'lucas.patel2@example.com', '+91 90986 25501', 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Wei Gupta', 'wei.gupta94@example.com', '+91 95602 66204', 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Ananya Smith', 'ananya.smith64@example.com', '+91 75237 15843', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Ananya Kapoor', 'ananya.kapoor42@example.com', '+91 79276 98696', 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Ananya Mehta', 'ananya.mehta65@example.com', NULL, 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Aditya Nair', 'aditya.nair63@example.com', NULL, 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Sneha Kapoor', 'sneha.kapoor90@example.com', '+91 80194 76267', 'United States') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Isha Desai', 'isha.desai7@example.com', NULL, 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Divya Patel', 'divya.patel91@example.com', '+91 77352 44941', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Hiroshi Tanaka', 'hiroshi.tanaka21@example.com', '+91 92237 46450', 'UAE') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Rohan Iyer', 'rohan.iyer3@example.com', '+91 99182 64629', 'Japan') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Ananya Gupta', 'ananya.gupta11@example.com', '+91 87243 69594', 'UAE') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Fatima Kapoor', 'fatima.kapoor75@example.com', '+91 95555 94042', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Vikram Rao', 'vikram.rao95@example.com', '+91 92177 31463', 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Nisha Gupta', 'nisha.gupta74@example.com', '+91 74796 60607', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Hiroshi Menon', 'hiroshi.menon85@example.com', '+91 84859 27868', 'Japan') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Vikram Kapoor', 'vikram.kapoor18@example.com', '+91 84657 46318', 'Japan') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Priya Iyer', 'priya.iyer18@example.com', '+91 97577 37826', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Kavya Singh', 'kavya.singh18@example.com', '+91 95564 13805', 'United States') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Rohan Nair', 'rohan.nair19@example.com', '+91 90253 86138', 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Nisha Bose', 'nisha.bose44@example.com', NULL, 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Hiroshi Sharma', 'hiroshi.sharma98@example.com', '+91 87840 45398', 'Japan') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Olivia Tanaka', 'olivia.tanaka16@example.com', NULL, 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Karan Kapoor', 'karan.kapoor42@example.com', '+91 82416 64139', 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Wei Menon', 'wei.menon80@example.com', '+91 89248 99783', 'United States') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Aditya Kapoor', 'aditya.kapoor57@example.com', '+91 81284 22910', 'United States') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Isha Joshi', 'isha.joshi88@example.com', '+91 99676 75867', 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Sarah Rao', 'sarah.rao90@example.com', '+91 75145 37424', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Nikhil Nair', 'nikhil.nair52@example.com', '+91 81403 39360', 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Pooja Gupta', 'pooja.gupta23@example.com', '+91 81267 94390', 'UAE') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Sarah Desai', 'sarah.desai9@example.com', '+91 79905 51691', 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Olivia Sharma', 'olivia.sharma55@example.com', '+91 83525 37654', 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Vikram Verma', 'vikram.verma59@example.com', '+91 91420 59542', 'UAE') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Daniel Verma', 'daniel.verma4@example.com', '+91 90547 63266', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Yuki Kapoor', 'yuki.kapoor10@example.com', NULL, 'United States') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Lucas Joshi', 'lucas.joshi32@example.com', '+91 96655 36258', 'UAE') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Priya Mehta', 'priya.mehta98@example.com', '+91 94312 35152', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Daniel Khan', 'daniel.khan53@example.com', NULL, 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Nikhil Desai', 'nikhil.desai79@example.com', '+91 72707 24360', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Rohan Johnson', 'rohan.johnson41@example.com', NULL, 'UAE') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Fatima Menon', 'fatima.menon65@example.com', '+91 80102 33629', 'Japan') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Meera Kapoor', 'meera.kapoor87@example.com', '+91 78337 46639', 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Karan Desai', 'karan.desai63@example.com', '+91 89424 35153', 'UAE') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Meera Iyer', 'meera.iyer68@example.com', '+91 77784 52562', 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Kavya Verma', 'kavya.verma44@example.com', '+91 72198 40978', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Karan Mehta', 'karan.mehta54@example.com', '+91 83416 56769', 'UAE') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Tara Khan', 'tara.khan29@example.com', '+91 94299 37200', 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Tara Rao', 'tara.rao1@example.com', '+91 82643 85265', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Rahul Gupta', 'rahul.gupta4@example.com', NULL, 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Yuki Chen', 'yuki.chen79@example.com', '+91 78224 99139', 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Sarah Iyer', 'sarah.iyer78@example.com', '+91 96581 36319', 'UAE') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Karan Chen', 'karan.chen27@example.com', NULL, 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Wei Iyer', 'wei.iyer8@example.com', '+91 80479 73549', 'UAE') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Lucas Sharma', 'lucas.sharma66@example.com', '+91 89952 38849', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Vikram Singh', 'vikram.singh69@example.com', '+91 80331 68475', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Karan Brown', 'karan.brown1@example.com', '+91 89677 14731', 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Fatima Gupta', 'fatima.gupta83@example.com', NULL, 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Meera Joshi', 'meera.joshi59@example.com', '+91 80441 25161', 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Isha Verma', 'isha.verma32@example.com', '+91 82187 37105', 'UAE') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Hiroshi Johnson', 'hiroshi.johnson40@example.com', '+91 90820 24624', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Daniel Joshi', 'daniel.joshi8@example.com', NULL, 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Olivia Johnson', 'olivia.johnson39@example.com', '+91 87346 11769', 'United States') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Lucas Brown', 'lucas.brown44@example.com', '+91 94102 51785', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Arjun Brown', 'arjun.brown67@example.com', '+91 85289 47309', 'UAE') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Emma Reddy', 'emma.reddy13@example.com', '+91 85572 47068', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('James Smith', 'james.smith56@example.com', '+91 96892 22686', 'Japan') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Ananya Mehta', 'ananya.mehta69@example.com', '+91 79785 38656', 'UAE') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Lucas Menon', 'lucas.menon61@example.com', '+91 77953 16538', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Nisha Johnson', 'nisha.johnson74@example.com', '+91 93346 57667', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Aarav Mehta', 'aarav.mehta65@example.com', '+91 96388 65845', 'United States') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Aarav Tanaka', 'aarav.tanaka3@example.com', '+91 73551 84479', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Tara Verma', 'tara.verma48@example.com', '+91 80781 32920', 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Sarah Reddy', 'sarah.reddy28@example.com', NULL, 'UAE') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Sanjay Brown', 'sanjay.brown15@example.com', '+91 73167 52667', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Nikhil Joshi', 'nikhil.joshi54@example.com', NULL, 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Olivia Kapoor', 'olivia.kapoor46@example.com', '+91 81166 60263', 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Isha Gupta', 'isha.gupta26@example.com', '+91 75395 90783', 'Japan') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Kavya Gupta', 'kavya.gupta51@example.com', '+91 97441 63831', 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Olivia Khan', 'olivia.khan64@example.com', '+91 96722 48125', 'UAE') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Ananya Gupta', 'ananya.gupta81@example.com', '+91 81739 17728', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Sarah Verma', 'sarah.verma95@example.com', '+91 84804 33935', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Hiroshi Reddy', 'hiroshi.reddy47@example.com', NULL, 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Nisha Bose', 'nisha.bose20@example.com', NULL, 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Vikram Sharma', 'vikram.sharma22@example.com', NULL, 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Karan Verma', 'karan.verma72@example.com', NULL, 'Japan') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Hiroshi Gupta', 'hiroshi.gupta57@example.com', '+91 84381 88725', 'Japan') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Rahul Verma', 'rahul.verma37@example.com', '+91 72373 42364', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Wei Tanaka', 'wei.tanaka25@example.com', '+91 77845 39371', 'UAE') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Rohan Chen', 'rohan.chen37@example.com', '+91 92816 31805', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Nikhil Reddy', 'nikhil.reddy93@example.com', NULL, 'United States') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Aditya Bose', 'aditya.bose68@example.com', '+91 75815 59944', 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Arjun Iyer', 'arjun.iyer6@example.com', '+91 97741 19531', 'UAE') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Nisha Brown', 'nisha.brown21@example.com', '+91 87661 51077', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Isha Tanaka', 'isha.tanaka58@example.com', '+91 88184 51662', 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Hiroshi Rao', 'hiroshi.rao28@example.com', '+91 74497 82983', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Kabir Chen', 'kabir.chen62@example.com', '+91 88373 70889', 'United States') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Rahul Rao', 'rahul.rao43@example.com', '+91 86471 38452', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Divya Smith', 'divya.smith34@example.com', NULL, 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Nikhil Bose', 'nikhil.bose49@example.com', '+91 86633 37045', 'Japan') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Ananya Menon', 'ananya.menon37@example.com', '+91 89148 28034', 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Emma Johnson', 'emma.johnson64@example.com', NULL, 'United States') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Sarah Tanaka', 'sarah.tanaka69@example.com', '+91 96295 62452', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Rahul Mehta', 'rahul.mehta18@example.com', '+91 96507 70028', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Tara Smith', 'tara.smith74@example.com', '+91 90827 35128', 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Wei Singh', 'wei.singh90@example.com', '+91 98649 50411', 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Aarav Rao', 'aarav.rao59@example.com', '+91 76701 22282', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Kabir Verma', 'kabir.verma64@example.com', '+91 80679 79302', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Wei Sharma', 'wei.sharma49@example.com', '+91 88703 48197', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Lucas Reddy', 'lucas.reddy43@example.com', '+91 75388 60023', 'United States') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Hiroshi Khan', 'hiroshi.khan30@example.com', NULL, 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Olivia Joshi', 'olivia.joshi90@example.com', '+91 83290 47204', 'United States') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Karan Smith', 'karan.smith49@example.com', '+91 82730 11138', 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Kavya Bose', 'kavya.bose97@example.com', '+91 94375 40934', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Nisha Mehta', 'nisha.mehta92@example.com', '+91 98570 31622', 'United States') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Vikram Johnson', 'vikram.johnson72@example.com', '+91 90447 97358', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Meera Sharma', 'meera.sharma26@example.com', '+91 79945 15026', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Emma Patel', 'emma.patel61@example.com', '+91 87496 78902', 'UAE') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Kavya Brown', 'kavya.brown63@example.com', '+91 75694 15627', 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Rahul Chen', 'rahul.chen16@example.com', '+91 73695 30356', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Aarav Verma', 'aarav.verma79@example.com', '+91 78161 53421', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Divya Gupta', 'divya.gupta71@example.com', '+91 85115 33006', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Arjun Khan', 'arjun.khan7@example.com', '+91 98876 28588', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Rohan Smith', 'rohan.smith69@example.com', '+91 83339 63067', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Wei Nair', 'wei.nair97@example.com', '+91 78165 91030', 'UAE') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Vikram Bose', 'vikram.bose89@example.com', '+91 81281 78990', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Olivia Brown', 'olivia.brown88@example.com', '+91 81995 82287', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Isha Smith', 'isha.smith4@example.com', NULL, 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Hiroshi Khan', 'hiroshi.khan69@example.com', '+91 72694 99282', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Sanjay Kapoor', 'sanjay.kapoor51@example.com', '+91 97736 79872', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Nikhil Mehta', 'nikhil.mehta58@example.com', '+91 90358 62566', 'UAE') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Tara Nair', 'tara.nair14@example.com', '+91 84518 70328', 'United States') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Meera Bose', 'meera.bose53@example.com', '+91 83611 40844', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Priya Reddy', 'priya.reddy70@example.com', '+91 87220 34540', 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Vikram Iyer', 'vikram.iyer45@example.com', '+91 97902 13148', 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Divya Brown', 'divya.brown81@example.com', '+91 88306 42046', 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Sarah Desai', 'sarah.desai33@example.com', '+91 76522 28093', 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Sanjay Singh', 'sanjay.singh64@example.com', '+91 91506 65058', 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Daniel Patel', 'daniel.patel39@example.com', NULL, 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Yuki Bose', 'yuki.bose10@example.com', '+91 71444 41760', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('James Mehta', 'james.mehta57@example.com', '+91 99456 79515', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Emma Tanaka', 'emma.tanaka45@example.com', '+91 98970 88949', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Fatima Patel', 'fatima.patel10@example.com', NULL, 'UAE') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Wei Chen', 'wei.chen21@example.com', '+91 74765 58817', 'United States') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Nikhil Reddy', 'nikhil.reddy17@example.com', '+91 75406 93722', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Nisha Mehta', 'nisha.mehta14@example.com', '+91 99824 73709', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Daniel Johnson', 'daniel.johnson79@example.com', '+91 85990 73008', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Sneha Joshi', 'sneha.joshi28@example.com', '+91 96373 96766', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Meera Joshi', 'meera.joshi3@example.com', '+91 97180 18464', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Isha Brown', 'isha.brown76@example.com', '+91 77470 27334', 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Sarah Joshi', 'sarah.joshi26@example.com', '+91 87937 94105', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Nikhil Nair', 'nikhil.nair64@example.com', '+91 97769 87484', 'UAE') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('James Kapoor', 'james.kapoor57@example.com', '+91 79121 44791', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Karan Verma', 'karan.verma8@example.com', NULL, 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Vikram Brown', 'vikram.brown9@example.com', '+91 70754 11979', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Meera Mehta', 'meera.mehta9@example.com', '+91 79944 51221', 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Fatima Chen', 'fatima.chen31@example.com', '+91 75638 64153', 'United States') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Lucas Verma', 'lucas.verma94@example.com', '+91 90415 32435', 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Pooja Bose', 'pooja.bose58@example.com', NULL, 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Priya Singh', 'priya.singh35@example.com', '+91 87175 50093', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Meera Singh', 'meera.singh18@example.com', '+91 70116 32659', 'Japan') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Isha Sharma', 'isha.sharma12@example.com', NULL, 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Rohan Mehta', 'rohan.mehta75@example.com', '+91 80225 17181', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Ananya Reddy', 'ananya.reddy65@example.com', '+91 97313 40765', 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Nisha Reddy', 'nisha.reddy32@example.com', NULL, 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Yuki Johnson', 'yuki.johnson8@example.com', '+91 91337 99167', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Nikhil Tanaka', 'nikhil.tanaka72@example.com', '+91 89809 64487', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Aditya Patel', 'aditya.patel25@example.com', NULL, 'Japan') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Kavya Desai', 'kavya.desai96@example.com', '+91 96830 73144', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Divya Reddy', 'divya.reddy49@example.com', '+91 88945 57049', 'Japan') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Fatima Nair', 'fatima.nair11@example.com', '+91 74292 45991', 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Pooja Smith', 'pooja.smith64@example.com', NULL, 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Rahul Sharma', 'rahul.sharma82@example.com', '+91 94956 93449', 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Meera Tanaka', 'meera.tanaka69@example.com', '+91 93231 49202', 'United States') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Ananya Gupta', 'ananya.gupta47@example.com', NULL, 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Ananya Brown', 'ananya.brown38@example.com', '+91 98844 93478', 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Aditya Sharma', 'aditya.sharma28@example.com', '+91 70475 41280', 'United States') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Sarah Tanaka', 'sarah.tanaka92@example.com', '+91 81663 82482', 'UAE') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Nikhil Johnson', 'nikhil.johnson5@example.com', '+91 88553 57146', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Kavya Gupta', 'kavya.gupta72@example.com', '+91 83457 49431', 'Japan') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Nisha Chen', 'nisha.chen53@example.com', '+91 92892 96204', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Pooja Gupta', 'pooja.gupta70@example.com', '+91 78117 78197', 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('James Verma', 'james.verma92@example.com', '+91 82199 92600', 'Japan') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Nisha Chen', 'nisha.chen26@example.com', NULL, 'Japan') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Lucas Joshi', 'lucas.joshi39@example.com', '+91 75840 85637', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Daniel Nair', 'daniel.nair64@example.com', '+91 88206 42544', 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Tara Singh', 'tara.singh74@example.com', '+91 79691 28011', 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Rohan Chen', 'rohan.chen27@example.com', '+91 95700 31858', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Isha Patel', 'isha.patel77@example.com', '+91 79354 22133', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Olivia Khan', 'olivia.khan27@example.com', '+91 89345 83338', 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Karan Bose', 'karan.bose10@example.com', '+91 79847 33140', 'Japan') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Vikram Khan', 'vikram.khan26@example.com', '+91 71306 59020', 'UAE') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Sarah Patel', 'sarah.patel10@example.com', '+91 76120 86445', 'United States') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Isha Reddy', 'isha.reddy42@example.com', '+91 85387 66768', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Tara Tanaka', 'tara.tanaka53@example.com', NULL, 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Pooja Kapoor', 'pooja.kapoor63@example.com', '+91 83233 46646', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Ananya Patel', 'ananya.patel93@example.com', '+91 88357 21103', 'UAE') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('James Gupta', 'james.gupta58@example.com', '+91 83616 44405', 'Japan') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Divya Johnson', 'divya.johnson30@example.com', '+91 83165 85111', 'Japan') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Sanjay Menon', 'sanjay.menon57@example.com', NULL, 'UAE') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Aarav Gupta', 'aarav.gupta29@example.com', '+91 93838 70176', 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Pooja Gupta', 'pooja.gupta98@example.com', '+91 71635 87435', 'Japan') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Pooja Bose', 'pooja.bose94@example.com', '+91 96339 37208', 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Ananya Brown', 'ananya.brown53@example.com', NULL, 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Emma Johnson', 'emma.johnson17@example.com', '+91 93315 86740', 'United States') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Divya Rao', 'divya.rao5@example.com', NULL, 'UAE') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Pooja Singh', 'pooja.singh39@example.com', '+91 79359 73530', 'Japan') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Divya Patel', 'divya.patel61@example.com', '+91 85979 97557', 'United States') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Vikram Desai', 'vikram.desai82@example.com', '+91 72830 75978', 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Tara Mehta', 'tara.mehta17@example.com', '+91 74481 44841', 'Singapore') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Aarav Bose', 'aarav.bose7@example.com', '+91 94412 11431', 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Yuki Menon', 'yuki.menon34@example.com', '+91 97199 19081', 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Olivia Brown', 'olivia.brown66@example.com', '+91 86495 77747', 'United Kingdom') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
INSERT INTO guests (full_name, email, phone, country) VALUES ('Yuki Gupta', 'yuki.gupta65@example.com', NULL, 'India') ON CONFLICT (lower(email)) WHERE email IS NOT NULL DO NOTHING;
-- bookings
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00001', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10017'), g.id, '2026-01-21', '2026-01-22', 1, 1, 0, 16540, 16540, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'karan.verma72@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00002', p.id, NULL, g.id, '2026-02-20', '2026-02-23', 3, 1, 0, 4080, 4080, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'wei.singh90@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00003', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10029'), g.id, '2026-03-27', '2026-04-02', 3, 2, 2, 26440, 26440, 'INR', 1, 'ota', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'sarah.gupta14@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00004', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10021'), g.id, '2026-07-16', '2026-07-21', 1, 1, 2, 14873, 14873, 'INR', 1, 'website', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'priya.mehta98@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00005', p.id, NULL, g.id, '2026-10-12', '2026-10-18', 2, 2, 0, 19401, 19401, 'INR', 1, 'ota', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'tara.verma48@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00006', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10036'), g.id, '2026-06-13', '2026-06-18', 1, 3, 0, 14787.5, 175, 'USD', 84.5, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'lucas.reddy43@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00007', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10008'), g.id, '2026-09-10', '2026-09-13', 1, 2, 0, 15744, 15744, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'kavya.bose97@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00008', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10023'), g.id, '2026-07-30', '2026-08-04', 3, 2, 1, 29543, 29543, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'kabir.chen62@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00009', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10027'), g.id, '2026-06-15', '2026-06-18', 3, 3, 0, 10326, 10326, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'ananya.gupta47@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00010', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10028'), g.id, '2026-09-24', '2026-09-25', 1, 1, 1, 7188, 7188, 'INR', 1, 'phone', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'isha.patel77@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00011', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10036'), g.id, '2026-08-22', '2026-08-25', 1, 1, 0, 17698, 17698, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'sarah.reddy28@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00012', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10027'), g.id, '2026-06-12', '2026-06-14', 2, 3, 0, 6337.5, 75, 'USD', 84.5, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'yuki.kapoor10@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00013', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10006'), g.id, '2026-02-08', '2026-02-10', 2, 2, 0, 20895, 20895, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'vikram.iyer45@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00014', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10020'), g.id, '2026-05-27', '2026-05-28', 2, 2, 1, 27278, 27278, 'INR', 1, 'ota', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'meera.kapoor87@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00015', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10011'), g.id, '2026-07-13', '2026-07-17', 1, 3, 1, 15182, 15182, 'INR', 1, 'walk_in', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'pooja.iyer60@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00016', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10034'), g.id, '2026-10-06', '2026-10-10', 1, 1, 0, 29959, 29959, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'nikhil.nair64@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00017', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10004'), g.id, '2026-03-13', '2026-03-16', 2, 2, 1, 8771, 8771, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'nisha.bose44@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00018', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10036'), g.id, '2026-04-12', '2026-04-13', 2, 3, 2, 9292, 9292, 'INR', 1, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'fatima.chen31@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00019', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10022'), g.id, '2026-09-26', '2026-09-28', 1, 4, 0, 21137, 21137, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'kavya.bose97@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00020', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10025'), g.id, '2026-06-11', '2026-06-17', 3, 2, 2, 9295, 110, 'USD', 84.5, 'walk_in', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'ananya.kapoor42@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00022', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10032'), g.id, '2026-05-11', '2026-05-15', 3, 1, 0, 21627, 21627, 'INR', 1, 'website', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'aditya.patel25@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00024', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10011'), g.id, '2026-07-27', '2026-07-28', 2, 4, 0, 11233, 11233, 'INR', 1, 'ota', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'sarah.desai33@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00025', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10004'), g.id, '2026-05-29', '2026-05-30', 3, 4, 0, 27953, 27953, 'INR', 1, 'walk_in', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'divya.johnson30@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00026', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10031'), g.id, '2026-10-26', '2026-10-31', 1, 3, 2, 18167.5, 215, 'USD', 84.5, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'sarah.gupta14@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00027', p.id, NULL, g.id, '2026-03-31', '2026-04-02', 1, 3, 0, 16055, 190, 'USD', 84.5, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'sneha.kapoor90@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00028', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10011'), g.id, '2026-06-29', '2026-07-01', 1, 1, 0, 18766, 18766, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'ananya.gupta47@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00030', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10033'), g.id, '2026-10-19', '2026-10-22', 2, 2, 1, 28830, 28830, 'INR', 1, 'walk_in', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'rahul.smith11@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00031', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10023'), g.id, '2026-04-12', '2026-04-15', 2, 1, 0, 4798, 4798, 'INR', 1, 'phone', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'rahul.gupta38@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00032', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10035'), g.id, '2026-08-20', '2026-08-24', 3, 2, 0, 29493, 29493, 'INR', 1, 'walk_in', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'aditya.sharma28@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00033', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10008'), g.id, '2026-08-06', '2026-08-09', 2, 4, 0, 19762, 19762, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'james.gupta58@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00034', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10035'), g.id, '2026-06-14', '2026-06-16', 2, 1, 0, 12015, 12015, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'lucas.johnson35@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00035', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10039'), g.id, '2026-02-25', '2026-02-26', 1, 1, 1, 13877, 13877, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'sneha.iyer88@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00036', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10005'), g.id, '2026-10-23', '2026-10-29', 2, 4, 0, 5399, 5399, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'daniel.joshi8@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00037', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10038'), g.id, '2026-07-12', '2026-07-15', 1, 2, 0, 16915, 16915, 'INR', 1, 'ota', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'divya.brown81@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00038', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10011'), g.id, '2026-05-09', '2026-05-11', 2, 2, 1, 25852, 25852, 'INR', 1, 'phone', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'wei.menon80@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00039', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10051'), g.id, '2026-03-26', '2026-03-28', 3, 3, 0, 11111, 11111, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'nikhil.johnson5@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00040', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10049'), g.id, '2026-09-12', '2026-09-14', 3, 1, 0, 23417, 23417, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'meera.sharma26@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00041', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10013'), g.id, '2026-06-06', '2026-06-08', 2, 1, 0, 17552, 17552, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'rahul.sharma82@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00042', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10019'), g.id, '2026-01-04', '2026-01-07', 3, 3, 0, 26537, 26537, 'INR', 1, 'phone', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'tara.tanaka53@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00043', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10017'), g.id, '2026-01-19', '2026-01-24', 3, 1, 1, 28297, 28297, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'james.chen5@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00044', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10040'), g.id, '2026-02-04', '2026-02-10', 3, 1, 0, 5492.5, 65, 'USD', 84.5, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'meera.bose53@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00045', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10026'), g.id, '2026-05-13', '2026-05-19', 1, 2, 0, 17900, 17900, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'vikram.singh69@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00046', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10011'), g.id, '2026-07-09', '2026-07-12', 2, 1, 0, 13315, 13315, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'ananya.mehta69@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00047', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10003'), g.id, '2026-03-11', '2026-03-12', 2, 4, 1, 20457, 20457, 'INR', 1, 'ota', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'fatima.chen31@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00049', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10017'), g.id, '2026-02-12', '2026-02-13', 2, 2, 0, 26660, 26660, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'meera.joshi59@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00050', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10028'), g.id, '2026-01-22', '2026-01-27', 1, 2, 0, 5492.5, 65, 'USD', 84.5, 'phone', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'nisha.mehta92@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00051', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10004'), g.id, '2026-10-24', '2026-10-27', 3, 4, 0, 21659, 21659, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'rahul.smith11@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00052', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10010'), g.id, '2026-02-21', '2026-02-26', 3, 2, 0, 10735, 10735, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'yuki.kapoor10@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00053', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10020'), g.id, '2026-04-25', '2026-04-26', 3, 3, 2, 15242, 15242, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'lucas.patel2@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00054', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10021'), g.id, '2026-03-20', '2026-03-22', 3, 2, 0, 14221, 14221, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'hiroshi.reddy47@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00055', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10037'), g.id, '2026-09-21', '2026-09-23', 1, 2, 0, 19765, 19765, 'INR', 1, 'ota', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'hiroshi.reddy47@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00056', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10054'), g.id, '2026-03-10', '2026-03-13', 1, 3, 0, 23237.5, 275, 'USD', 84.5, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'nikhil.kapoor67@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00057', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10058'), g.id, '2026-04-14', '2026-04-15', 3, 1, 0, 6886, 6886, 'INR', 1, 'phone', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'tara.tanaka53@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00058', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10016'), g.id, '2026-10-23', '2026-10-28', 3, 1, 0, 24176, 24176, 'INR', 1, 'ota', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'divya.patel61@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00060', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10028'), g.id, '2026-04-17', '2026-04-18', 1, 1, 0, 20642, 20642, 'INR', 1, 'direct', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'aarav.rao59@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00061', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10035'), g.id, '2026-10-23', '2026-10-25', 1, 4, 0, 27885, 330, 'USD', 84.5, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'sneha.iyer88@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00062', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10004'), g.id, '2026-07-20', '2026-07-26', 1, 2, 0, 9717.5, 115, 'USD', 84.5, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'pooja.bose94@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00063', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10033'), g.id, '2026-06-01', '2026-06-04', 2, 3, 0, 9252, 9252, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'lucas.johnson35@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00064', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10015'), g.id, '2026-05-14', '2026-05-17', 3, 2, 2, 27347, 27347, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'aarav.tanaka3@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00065', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10042'), g.id, '2026-02-04', '2026-02-08', 3, 3, 1, 25183, 25183, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'karan.verma8@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00066', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10012'), g.id, '2026-03-28', '2026-04-01', 1, 4, 0, 26188, 26188, 'INR', 1, 'phone', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'sarah.patel10@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00067', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10018'), g.id, '2026-04-27', '2026-05-01', 3, 3, 0, 20493, 20493, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'priya.mehta98@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00068', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10046'), g.id, '2026-06-04', '2026-06-06', 2, 3, 0, 21187, 21187, 'INR', 1, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'pooja.smith64@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00069', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10020'), g.id, '2026-05-24', '2026-05-29', 2, 2, 0, 10447, 10447, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'meera.johnson55@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00070', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10054'), g.id, '2026-01-31', '2026-02-02', 2, 2, 1, 20280, 240, 'USD', 84.5, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'ananya.kapoor42@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00071', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10055'), g.id, '2026-08-08', '2026-08-12', 2, 2, 0, 24560, 24560, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'isha.reddy42@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00072', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10018'), g.id, '2026-08-21', '2026-08-25', 1, 1, 0, 19012.5, 225, 'USD', 84.5, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'sneha.joshi28@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00073', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10026'), g.id, '2026-02-21', '2026-02-26', 3, 3, 0, 16055, 190, 'USD', 84.5, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'pooja.gupta70@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00074', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10064'), g.id, '2026-02-16', '2026-02-18', 3, 2, 2, 27921, 27921, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'olivia.khan64@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00075', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10023'), g.id, '2026-04-30', '2026-05-01', 3, 4, 0, 23845, 23845, 'INR', 1, 'phone', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'yuki.menon34@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00076', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10016'), g.id, '2026-10-07', '2026-10-13', 2, 1, 0, 12556, 12556, 'INR', 1, 'phone', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'fatima.menon65@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00077', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10037'), g.id, '2026-04-30', '2026-05-02', 3, 2, 0, 11208, 11208, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'tara.tanaka53@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00079', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10017'), g.id, '2026-01-25', '2026-01-27', 2, 2, 0, 16055, 190, 'USD', 84.5, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'nikhil.mehta58@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00080', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10031'), g.id, '2026-05-16', '2026-05-22', 2, 3, 0, 6337.5, 75, 'USD', 84.5, 'phone', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'nikhil.joshi54@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00081', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10030'), g.id, '2026-07-22', '2026-07-24', 3, 4, 2, 8754, 8754, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'ananya.brown53@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00082', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10029'), g.id, '2026-09-17', '2026-09-18', 1, 1, 1, 5909, 5909, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'nikhil.nair52@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00083', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10019'), g.id, '2026-08-14', '2026-08-20', 1, 3, 2, 12891, 12891, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'james.verma92@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00084', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10042'), g.id, '2026-05-10', '2026-05-12', 3, 2, 0, 18398, 18398, 'INR', 1, 'ota', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'nisha.chen53@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00085', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10010'), g.id, '2026-07-24', '2026-07-26', 1, 3, 0, 10726, 10726, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'wei.gupta94@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00086', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10028'), g.id, '2026-03-16', '2026-03-17', 3, 2, 0, 11280, 11280, 'INR', 1, 'website', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'kavya.verma44@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00087', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10017'), g.id, '2026-05-02', '2026-05-08', 2, 1, 2, 20518, 20518, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'lucas.joshi32@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00088', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10007'), g.id, '2026-07-31', '2026-08-05', 1, 2, 0, 10140, 120, 'USD', 84.5, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'nisha.mehta92@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00089', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10025'), g.id, '2026-01-18', '2026-01-21', 1, 1, 0, 24976, 24976, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'hiroshi.sharma98@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00090', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10007'), g.id, '2026-06-18', '2026-06-19', 3, 3, 0, 26345, 26345, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'pooja.singh39@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00091', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10033'), g.id, '2026-08-18', '2026-08-22', 2, 4, 0, 29575, 350, 'USD', 84.5, 'direct', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'emma.johnson64@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00092', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10030'), g.id, '2026-08-09', '2026-08-12', 3, 1, 2, 12475, 12475, 'INR', 1, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'wei.tanaka25@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00093', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10049'), g.id, '2026-01-29', '2026-01-30', 1, 2, 1, 28089, 28089, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'sarah.reddy28@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00094', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10002'), g.id, '2026-08-19', '2026-08-25', 1, 2, 1, 23237.5, 275, 'USD', 84.5, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'karan.bose10@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00095', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10008'), g.id, '2026-07-21', '2026-07-23', 1, 3, 0, 15639, 15639, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'lucas.reddy43@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00096', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10020'), g.id, '2026-06-17', '2026-06-22', 1, 1, 0, 24202, 24202, 'INR', 1, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'pooja.kapoor63@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00098', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10035'), g.id, '2026-09-24', '2026-09-28', 3, 3, 0, 26192, 26192, 'INR', 1, 'ota', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'wei.iyer8@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00099', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10069'), g.id, '2026-03-15', '2026-03-19', 1, 2, 0, 26832, 26832, 'INR', 1, 'direct', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'isha.sharma12@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00100', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10022'), g.id, '2026-04-11', '2026-04-14', 3, 2, 0, 9440, 9440, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'sarah.patel10@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00101', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10036'), g.id, '2026-09-03', '2026-09-04', 1, 4, 0, 16006, 16006, 'INR', 1, 'direct', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'vikram.kapoor18@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00102', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10026'), g.id, '2026-03-26', '2026-03-31', 2, 3, 0, 14274, 14274, 'INR', 1, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'tara.singh74@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00103', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10009'), g.id, '2026-01-06', '2026-01-09', 2, 4, 0, 23951, 23951, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'wei.chen21@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00104', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10022'), g.id, '2026-10-02', '2026-10-03', 1, 1, 2, 15022, 15022, 'INR', 1, 'phone', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'rohan.nair19@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00105', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10003'), g.id, '2026-04-25', '2026-04-26', 2, 2, 0, 12185, 12185, 'INR', 1, 'ota', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'rahul.chen16@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00106', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10029'), g.id, '2026-04-11', '2026-04-13', 3, 3, 0, 18781, 18781, 'INR', 1, 'direct', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'tara.tanaka53@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00107', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10046'), g.id, '2026-08-01', '2026-08-05', 2, 2, 0, 16707, 16707, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'arjun.iyer6@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00108', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10003'), g.id, '2026-04-04', '2026-04-10', 2, 1, 0, 20885, 20885, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'nikhil.mehta58@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00109', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10009'), g.id, '2026-09-01', '2026-09-02', 3, 2, 0, 9058, 9058, 'INR', 1, 'walk_in', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'james.mehta57@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00110', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10003'), g.id, '2026-05-30', '2026-05-31', 3, 3, 0, 10562.5, 125, 'USD', 84.5, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'aarav.bose7@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00111', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10019'), g.id, '2026-01-17', '2026-01-20', 3, 3, 0, 11407.5, 135, 'USD', 84.5, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'vikram.kapoor10@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00112', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10002'), g.id, '2026-05-31', '2026-06-01', 2, 4, 0, 16950, 16950, 'INR', 1, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'fatima.menon65@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00113', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10030'), g.id, '2026-05-02', '2026-05-03', 1, 1, 0, 7182.5, 85, 'USD', 84.5, 'website', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'vikram.brown9@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00114', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10026'), g.id, '2026-04-27', '2026-04-29', 1, 1, 0, 17322.5, 205, 'USD', 84.5, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'sneha.iyer88@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00115', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10010'), g.id, '2026-03-27', '2026-04-02', 2, 1, 1, 16399, 16399, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'nikhil.nair52@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00116', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10003'), g.id, '2026-05-27', '2026-06-02', 3, 2, 0, 12283, 12283, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'olivia.tanaka16@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00117', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10036'), g.id, '2026-02-11', '2026-02-15', 2, 1, 0, 5915, 70, 'USD', 84.5, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'hiroshi.reddy47@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00118', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10004'), g.id, '2026-02-22', '2026-02-28', 2, 1, 0, 5833, 5833, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'rahul.rao43@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00119', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10005'), g.id, '2026-08-06', '2026-08-11', 2, 3, 0, 22243, 22243, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'karan.chen27@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00120', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10011'), g.id, '2026-09-14', '2026-09-20', 3, 3, 2, 8876, 8876, 'INR', 1, 'website', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'olivia.khan64@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00121', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10012'), g.id, '2026-04-04', '2026-04-10', 1, 1, 2, 11023, 11023, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'sarah.rao90@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00122', p.id, NULL, g.id, '2026-10-14', '2026-10-19', 3, 1, 0, 24883, 24883, 'INR', 1, 'walk_in', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'divya.patel61@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00123', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10025'), g.id, '2026-10-02', '2026-10-06', 2, 4, 2, 9303, 9303, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'daniel.joshi8@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00124', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10020'), g.id, '2026-06-13', '2026-06-17', 3, 3, 1, 19710, 19710, 'INR', 1, 'website', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'tara.singh74@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00125', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10056'), g.id, '2026-03-25', '2026-03-30', 1, 4, 0, 5238, 5238, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'james.chen5@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00126', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10036'), g.id, '2026-05-07', '2026-05-08', 3, 3, 0, 25984, 25984, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'pooja.gupta98@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00127', p.id, NULL, g.id, '2026-10-04', '2026-10-09', 3, 1, 1, 7494, 7494, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'rohan.johnson41@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00128', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10003'), g.id, '2026-09-02', '2026-09-08', 2, 2, 0, 19883, 19883, 'INR', 1, 'direct', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'pooja.iyer60@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00129', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10063'), g.id, '2026-09-28', '2026-09-29', 3, 4, 0, 23237.5, 275, 'USD', 84.5, 'phone', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'meera.johnson55@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00130', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10008'), g.id, '2026-01-14', '2026-01-19', 2, 1, 0, 24292, 24292, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'lucas.johnson35@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00131', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10037'), g.id, '2026-01-02', '2026-01-05', 2, 3, 0, 23660, 280, 'USD', 84.5, 'phone', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'wei.chen21@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00132', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10011'), g.id, '2026-09-02', '2026-09-04', 2, 4, 2, 10985, 130, 'USD', 84.5, 'ota', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'james.verma92@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00133', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10034'), g.id, '2026-10-05', '2026-10-08', 3, 2, 0, 13548, 13548, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'divya.patel61@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00134', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10021'), g.id, '2026-03-12', '2026-03-17', 1, 3, 0, 5484, 5484, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'rahul.gupta38@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00135', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10023'), g.id, '2026-08-12', '2026-08-15', 1, 1, 0, 21994, 21994, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'ananya.patel93@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00136', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10025'), g.id, '2026-09-28', '2026-09-29', 2, 2, 0, 22111, 22111, 'INR', 1, 'phone', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'lucas.johnson35@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00137', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10009'), g.id, '2026-09-25', '2026-09-29', 2, 2, 0, 12792, 12792, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'nikhil.mehta58@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00138', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10048'), g.id, '2026-03-20', '2026-03-24', 3, 2, 0, 19012.5, 225, 'USD', 84.5, 'direct', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'tara.singh74@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00139', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10014'), g.id, '2026-08-16', '2026-08-22', 3, 4, 0, 27915, 27915, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'vikram.verma59@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00140', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10022'), g.id, '2026-09-28', '2026-10-01', 1, 1, 2, 14812, 14812, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'rohan.chen27@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00141', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10065'), g.id, '2026-08-15', '2026-08-16', 2, 4, 0, 11483, 11483, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'yuki.sharma49@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00142', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10061'), g.id, '2026-03-20', '2026-03-25', 1, 2, 0, 16477.5, 195, 'USD', 84.5, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'karan.chen27@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00143', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10039'), g.id, '2026-08-16', '2026-08-21', 1, 2, 2, 20026, 20026, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'meera.sharma26@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00144', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10017'), g.id, '2026-07-13', '2026-07-17', 2, 4, 0, 5041, 5041, 'INR', 1, 'walk_in', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'rahul.gupta38@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00145', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10034'), g.id, '2026-04-14', '2026-04-20', 2, 1, 0, 9170, 9170, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'tara.rao1@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00146', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10009'), g.id, '2026-08-17', '2026-08-21', 3, 2, 2, 12675, 150, 'USD', 84.5, 'direct', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'aarav.mehta65@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00147', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10048'), g.id, '2026-05-04', '2026-05-10', 2, 2, 0, 27398, 27398, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'james.verma92@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00148', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10034'), g.id, '2026-01-29', '2026-02-03', 1, 2, 0, 24821, 24821, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'kabir.chen62@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00149', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10030'), g.id, '2026-10-01', '2026-10-04', 3, 2, 0, 9396, 9396, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'vikram.desai82@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00150', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10030'), g.id, '2026-04-13', '2026-04-18', 1, 4, 2, 16900, 200, 'USD', 84.5, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'emma.johnson64@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00151', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10006'), g.id, '2026-04-22', '2026-04-25', 2, 2, 0, 16149, 16149, 'INR', 1, 'ota', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'wei.gupta94@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00152', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10014'), g.id, '2026-06-16', '2026-06-21', 1, 2, 0, 9182, 9182, 'INR', 1, 'direct', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'olivia.joshi90@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00153', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10003'), g.id, '2026-06-13', '2026-06-16', 1, 2, 2, 23248, 23248, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'yuki.sharma49@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00154', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10023'), g.id, '2026-05-01', '2026-05-07', 1, 2, 0, 16428, 16428, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'isha.verma32@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00155', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10001'), g.id, '2026-06-26', '2026-07-02', 2, 1, 0, 29997.5, 355, 'USD', 84.5, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'karan.bose10@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00156', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10038'), g.id, '2026-07-30', '2026-08-02', 1, 2, 0, 15632.5, 185, 'USD', 84.5, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'meera.iyer68@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00158', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10010'), g.id, '2026-07-14', '2026-07-16', 3, 1, 0, 21125, 250, 'USD', 84.5, 'direct', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'ananya.kapoor42@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00159', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10032'), g.id, '2026-05-12', '2026-05-16', 1, 3, 0, 24529, 24529, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'james.smith56@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00160', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10036'), g.id, '2026-04-04', '2026-04-10', 3, 1, 0, 15096, 15096, 'INR', 1, 'walk_in', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'meera.johnson55@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00161', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10036'), g.id, '2026-07-15', '2026-07-19', 1, 2, 0, 23660, 280, 'USD', 84.5, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'divya.gupta71@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00162', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10028'), g.id, '2026-07-08', '2026-07-12', 1, 4, 0, 26597, 26597, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'divya.smith34@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00164', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10016'), g.id, '2026-03-02', '2026-03-06', 2, 4, 1, 28461, 28461, 'INR', 1, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'pooja.gupta98@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00165', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10034'), g.id, '2026-10-13', '2026-10-15', 2, 2, 0, 21280, 21280, 'INR', 1, 'website', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'divya.patel61@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00166', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10015'), g.id, '2026-09-10', '2026-09-11', 1, 1, 0, 14748, 14748, 'INR', 1, 'phone', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'divya.brown81@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00167', p.id, NULL, g.id, '2026-04-29', '2026-05-02', 2, 3, 2, 21125, 250, 'USD', 84.5, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'divya.rao5@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00168', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10034'), g.id, '2026-02-10', '2026-02-14', 2, 2, 2, 9180, 9180, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'isha.sharma12@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00169', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10030'), g.id, '2026-03-25', '2026-03-29', 1, 2, 0, 9124, 9124, 'INR', 1, 'phone', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'sanjay.menon57@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00171', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10029'), g.id, '2026-08-15', '2026-08-21', 3, 4, 0, 27671, 27671, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'rahul.smith11@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00172', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10065'), g.id, '2026-09-30', '2026-10-03', 2, 2, 0, 14843, 14843, 'INR', 1, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'divya.gupta71@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00173', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10053'), g.id, '2026-06-13', '2026-06-17', 2, 4, 2, 12283, 12283, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'rohan.mehta75@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00174', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10023'), g.id, '2026-09-15', '2026-09-21', 2, 2, 2, 13979, 13979, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'hiroshi.reddy47@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00175', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10023'), g.id, '2026-05-10', '2026-05-12', 3, 3, 0, 11754, 11754, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'sneha.kapoor90@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00176', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10054'), g.id, '2026-07-06', '2026-07-08', 1, 1, 2, 19435, 230, 'USD', 84.5, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'karan.desai63@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00177', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10005'), g.id, '2026-02-27', '2026-03-05', 1, 4, 2, 4682, 4682, 'INR', 1, 'walk_in', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'ananya.reddy65@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00179', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10013'), g.id, '2026-07-24', '2026-07-27', 2, 2, 1, 11947, 11947, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'fatima.kapoor75@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00180', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10011'), g.id, '2026-04-16', '2026-04-19', 3, 3, 0, 7298, 7298, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'nikhil.reddy93@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00181', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10012'), g.id, '2026-01-01', '2026-01-05', 1, 2, 0, 29407, 29407, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'karan.smith49@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00182', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10031'), g.id, '2026-02-21', '2026-02-22', 3, 4, 0, 25364, 25364, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'james.smith56@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00183', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10002'), g.id, '2026-08-10', '2026-08-11', 3, 3, 0, 9225, 9225, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'hiroshi.reddy47@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00184', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10033'), g.id, '2026-07-29', '2026-08-01', 1, 4, 0, 27749, 27749, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'emma.johnson17@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00185', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10031'), g.id, '2026-10-13', '2026-10-19', 3, 1, 0, 23333, 23333, 'INR', 1, 'direct', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'sanjay.brown15@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00186', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10032'), g.id, '2026-03-15', '2026-03-16', 3, 2, 0, 27723, 27723, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'nisha.chen26@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00187', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10035'), g.id, '2026-08-17', '2026-08-22', 1, 4, 0, 29237, 29237, 'INR', 1, 'walk_in', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'hiroshi.sharma98@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00188', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10047'), g.id, '2026-07-08', '2026-07-11', 2, 1, 0, 26262, 26262, 'INR', 1, 'direct', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'yuki.bose10@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00189', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10049'), g.id, '2026-05-12', '2026-05-13', 2, 1, 0, 21125, 250, 'USD', 84.5, 'direct', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'sanjay.kapoor51@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00190', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10016'), g.id, '2026-04-14', '2026-04-15', 1, 3, 0, 17886, 17886, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'sarah.tanaka92@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00191', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10030'), g.id, '2026-08-22', '2026-08-26', 2, 4, 0, 11432, 11432, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'sneha.iyer88@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00192', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10019'), g.id, '2026-05-06', '2026-05-08', 1, 1, 1, 28102, 28102, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'meera.kapoor87@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00193', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10026'), g.id, '2026-08-23', '2026-08-29', 1, 3, 1, 17144, 17144, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'vikram.iyer45@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00194', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10038'), g.id, '2026-07-24', '2026-07-25', 1, 1, 2, 11830, 140, 'USD', 84.5, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'isha.brown76@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00195', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10001'), g.id, '2026-03-05', '2026-03-06', 3, 2, 0, 5426, 5426, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'nikhil.joshi54@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00196', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10015'), g.id, '2026-05-19', '2026-05-24', 1, 4, 0, 24452, 24452, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'nisha.brown21@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00197', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10022'), g.id, '2026-05-25', '2026-05-28', 2, 1, 0, 13120, 13120, 'INR', 1, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'nisha.chen26@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00198', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10004'), g.id, '2026-08-25', '2026-08-31', 3, 1, 2, 6859, 6859, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'vikram.singh69@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00199', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10026'), g.id, '2026-09-25', '2026-10-01', 3, 3, 1, 5997, 5997, 'INR', 1, 'direct', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'ananya.gupta47@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00200', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10032'), g.id, '2026-04-25', '2026-04-27', 2, 2, 2, 21854, 21854, 'INR', 1, 'ota', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'vikram.sharma22@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00202', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10023'), g.id, '2026-10-11', '2026-10-15', 1, 1, 1, 8770, 8770, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'aditya.kapoor57@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00203', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10031'), g.id, '2026-06-29', '2026-07-04', 3, 3, 0, 22986, 22986, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'sarah.desai9@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00204', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10008'), g.id, '2026-05-19', '2026-05-20', 1, 4, 0, 10562.5, 125, 'USD', 84.5, 'ota', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'sarah.reddy28@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00205', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10028'), g.id, '2026-03-20', '2026-03-23', 3, 1, 0, 11740, 11740, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'daniel.patel39@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00206', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10014'), g.id, '2026-03-20', '2026-03-25', 2, 4, 0, 15303, 15303, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'ananya.mehta69@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00207', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10051'), g.id, '2026-09-13', '2026-09-16', 3, 2, 0, 14279, 14279, 'INR', 1, 'ota', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'vikram.iyer45@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00208', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10005'), g.id, '2026-02-13', '2026-02-14', 2, 3, 0, 9352, 9352, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'karan.smith49@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00209', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10012'), g.id, '2026-08-17', '2026-08-20', 2, 2, 0, 5621, 5621, 'INR', 1, 'walk_in', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'isha.joshi88@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00210', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10046'), g.id, '2026-02-11', '2026-02-14', 2, 2, 0, 19275, 19275, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'olivia.joshi90@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00211', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10024'), g.id, '2026-02-05', '2026-02-06', 1, 2, 1, 15063, 15063, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'aarav.mehta65@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00212', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10060'), g.id, '2026-04-08', '2026-04-09', 3, 4, 0, 26031, 26031, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'rahul.smith11@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00213', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10056'), g.id, '2026-02-08', '2026-02-10', 1, 4, 0, 4157, 4157, 'INR', 1, 'website', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'isha.smith4@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00214', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10045'), g.id, '2026-08-01', '2026-08-07', 2, 3, 0, 25772.5, 305, 'USD', 84.5, 'ota', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'rohan.chen27@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00215', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10040'), g.id, '2026-08-16', '2026-08-22', 3, 4, 1, 26210, 26210, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'sarah.gupta14@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00216', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10012'), g.id, '2026-05-20', '2026-05-23', 2, 2, 2, 27913, 27913, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'nikhil.nair64@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00217', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10013'), g.id, '2026-05-20', '2026-05-25', 3, 1, 0, 10365, 10365, 'INR', 1, 'ota', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'james.chen5@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00218', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10030'), g.id, '2026-08-13', '2026-08-15', 1, 4, 2, 10562.5, 125, 'USD', 84.5, 'direct', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'vikram.bose89@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00219', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10001'), g.id, '2026-04-05', '2026-04-09', 1, 3, 0, 16500, 16500, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'karan.smith49@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00220', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10052'), g.id, '2026-04-07', '2026-04-09', 3, 1, 0, 12452, 12452, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'aarav.mehta65@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00221', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10005'), g.id, '2026-01-18', '2026-01-21', 1, 4, 0, 13283, 13283, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'pooja.gupta70@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00222', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10014'), g.id, '2026-06-14', '2026-06-16', 1, 3, 0, 20678, 20678, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'pooja.smith64@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00223', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10015'), g.id, '2026-08-04', '2026-08-08', 3, 2, 2, 6769, 6769, 'INR', 1, 'website', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'tara.khan29@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00224', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10009'), g.id, '2026-01-15', '2026-01-16', 2, 4, 1, 16786, 16786, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'nikhil.reddy93@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00225', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10006'), g.id, '2026-02-03', '2026-02-07', 2, 3, 0, 21992, 21992, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'pooja.singh39@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00226', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10023'), g.id, '2026-04-22', '2026-04-23', 3, 1, 0, 21351, 21351, 'INR', 1, 'website', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'sarah.joshi26@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00227', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10006'), g.id, '2026-01-09', '2026-01-14', 1, 3, 0, 28579, 28579, 'INR', 1, 'ota', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'pooja.iyer60@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00228', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10004'), g.id, '2026-05-14', '2026-05-18', 2, 2, 2, 17018, 17018, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'wei.gupta94@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00229', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10009'), g.id, '2026-03-26', '2026-03-27', 1, 4, 0, 23331, 23331, 'INR', 1, 'phone', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'sarah.tanaka69@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00230', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10004'), g.id, '2026-08-04', '2026-08-07', 1, 1, 0, 18285, 18285, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'sarah.gupta14@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00231', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10004'), g.id, '2026-01-19', '2026-01-21', 2, 3, 0, 15210, 180, 'USD', 84.5, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'olivia.johnson39@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00232', p.id, NULL, g.id, '2026-10-16', '2026-10-20', 3, 2, 0, 19951, 19951, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'isha.smith4@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00234', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10025'), g.id, '2026-02-05', '2026-02-11', 2, 4, 0, 23853, 23853, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'emma.patel61@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00235', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10035'), g.id, '2026-04-25', '2026-04-28', 2, 2, 1, 20524, 20524, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'sarah.iyer78@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00236', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10024'), g.id, '2026-04-29', '2026-05-05', 1, 4, 0, 16542, 16542, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'nikhil.tanaka72@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00237', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10004'), g.id, '2026-07-14', '2026-07-18', 3, 2, 0, 23497, 23497, 'INR', 1, 'ota', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'nikhil.reddy93@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00238', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10011'), g.id, '2026-04-19', '2026-04-22', 2, 4, 0, 6895, 6895, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'hiroshi.tanaka21@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00239', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10034'), g.id, '2026-03-25', '2026-03-27', 3, 2, 0, 13942.5, 165, 'USD', 84.5, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'divya.gupta71@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00240', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10034'), g.id, '2026-04-10', '2026-04-15', 1, 4, 1, 8356, 8356, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'sarah.desai33@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00241', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10016'), g.id, '2026-08-20', '2026-08-23', 3, 3, 0, 27468, 27468, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'olivia.brown88@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00243', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10023'), g.id, '2026-01-12', '2026-01-18', 3, 1, 0, 4425, 4425, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'priya.reddy70@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00244', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10037'), g.id, '2026-05-27', '2026-05-29', 3, 3, 0, 22126, 22126, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'lucas.reddy43@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00245', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10039'), g.id, '2026-04-13', '2026-04-16', 3, 4, 2, 10451, 10451, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'yuki.menon34@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00246', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10016'), g.id, '2026-06-11', '2026-06-14', 3, 3, 0, 21690, 21690, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'vikram.singh69@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00247', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10004'), g.id, '2026-03-20', '2026-03-25', 3, 4, 2, 24254, 24254, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'divya.reddy49@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00248', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10024'), g.id, '2026-10-23', '2026-10-29', 3, 4, 0, 28051, 28051, 'INR', 1, 'direct', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'kavya.singh18@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00249', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10024'), g.id, '2026-02-15', '2026-02-19', 3, 1, 0, 16459, 16459, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'pooja.kapoor63@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00250', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10010'), g.id, '2026-08-18', '2026-08-23', 2, 1, 0, 20728, 20728, 'INR', 1, 'direct', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'divya.reddy49@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00251', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10009'), g.id, '2026-06-02', '2026-06-03', 2, 2, 0, 25387, 25387, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'sarah.iyer78@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00252', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10027'), g.id, '2026-03-05', '2026-03-06', 3, 4, 1, 22540, 22540, 'INR', 1, 'direct', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'vikram.rao95@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00253', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10058'), g.id, '2026-10-05', '2026-10-09', 1, 2, 1, 14173, 14173, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'james.gupta58@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00254', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10043'), g.id, '2026-06-02', '2026-06-03', 2, 1, 0, 5915, 70, 'USD', 84.5, 'website', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'karan.verma8@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00255', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10034'), g.id, '2026-08-27', '2026-08-29', 2, 4, 2, 16867, 16867, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'ananya.brown53@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00256', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10058'), g.id, '2026-04-01', '2026-04-04', 3, 2, 0, 18333, 18333, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'yuki.johnson8@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00257', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10017'), g.id, '2026-05-14', '2026-05-16', 2, 3, 0, 27154, 27154, 'INR', 1, 'phone', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'olivia.brown88@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00258', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10006'), g.id, '2026-08-25', '2026-08-26', 3, 2, 0, 28541, 28541, 'INR', 1, 'direct', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'nikhil.desai79@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00259', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10023'), g.id, '2026-02-16', '2026-02-19', 2, 4, 0, 20111, 20111, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'wei.gupta94@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00260', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10023'), g.id, '2026-01-03', '2026-01-05', 2, 4, 0, 9295, 110, 'USD', 84.5, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'karan.verma8@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00261', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10029'), g.id, '2026-05-29', '2026-06-02', 2, 3, 0, 26717, 26717, 'INR', 1, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'aarav.mehta65@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00262', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10021'), g.id, '2026-06-20', '2026-06-22', 2, 3, 0, 12321, 12321, 'INR', 1, 'walk_in', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'meera.joshi59@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00263', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10023'), g.id, '2026-05-19', '2026-05-25', 2, 2, 2, 28033, 28033, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'hiroshi.sharma98@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00264', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10010'), g.id, '2026-02-10', '2026-02-14', 2, 4, 0, 12441, 12441, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'arjun.brown67@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00265', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10030'), g.id, '2026-04-05', '2026-04-10', 1, 1, 0, 9306, 9306, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'hiroshi.gupta57@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00266', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10015'), g.id, '2026-10-21', '2026-10-24', 1, 1, 0, 20241, 20241, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'ananya.patel93@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00268', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10002'), g.id, '2026-07-02', '2026-07-06', 3, 2, 0, 27624, 27624, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'vikram.iyer45@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00269', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10023'), g.id, '2026-01-02', '2026-01-08', 3, 4, 0, 28217, 28217, 'INR', 1, 'walk_in', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'lucas.menon61@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00270', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10019'), g.id, '2026-05-18', '2026-05-21', 3, 1, 0, 10714, 10714, 'INR', 1, 'direct', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'wei.sharma49@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00271', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10017'), g.id, '2026-01-07', '2026-01-10', 3, 1, 0, 9717.5, 115, 'USD', 84.5, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'daniel.joshi8@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00272', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10020'), g.id, '2026-02-10', '2026-02-11', 2, 4, 0, 24707, 24707, 'INR', 1, 'ota', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'arjun.iyer6@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00273', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10008'), g.id, '2026-07-13', '2026-07-16', 1, 4, 0, 25536, 25536, 'INR', 1, 'phone', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'ananya.mehta69@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00274', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10060'), g.id, '2026-06-12', '2026-06-16', 3, 1, 0, 5851, 5851, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'tara.mehta17@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00275', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10013'), g.id, '2026-09-24', '2026-09-26', 2, 2, 0, 27120, 27120, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'divya.reddy49@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00276', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10044'), g.id, '2026-03-30', '2026-04-03', 1, 4, 0, 9471, 9471, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'nikhil.joshi54@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00277', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10006'), g.id, '2026-07-13', '2026-07-16', 1, 1, 0, 17745, 210, 'USD', 84.5, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'daniel.johnson79@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00278', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10005'), g.id, '2026-06-15', '2026-06-20', 3, 3, 0, 8450, 100, 'USD', 84.5, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'olivia.tanaka16@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00279', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10059'), g.id, '2026-08-09', '2026-08-12', 2, 2, 0, 21118, 21118, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'nikhil.nair64@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00280', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10005'), g.id, '2026-06-13', '2026-06-15', 2, 2, 0, 21970, 260, 'USD', 84.5, 'ota', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'nikhil.reddy93@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00281', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10013'), g.id, '2026-01-04', '2026-01-07', 3, 2, 0, 29799, 29799, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'rohan.johnson41@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00282', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10011'), g.id, '2026-05-09', '2026-05-11', 3, 2, 0, 21509, 21509, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'lucas.joshi32@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00283', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10026'), g.id, '2026-04-11', '2026-04-13', 2, 2, 0, 6593, 6593, 'INR', 1, 'phone', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'sarah.joshi26@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00284', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10041'), g.id, '2026-03-17', '2026-03-20', 2, 3, 0, 10933, 10933, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'hiroshi.menon85@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00285', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10021'), g.id, '2026-03-19', '2026-03-23', 1, 2, 0, 26903, 26903, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'meera.johnson55@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00286', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10006'), g.id, '2026-02-12', '2026-02-14', 3, 2, 0, 23660, 280, 'USD', 84.5, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'wei.menon80@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00287', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10013'), g.id, '2026-08-06', '2026-08-08', 3, 2, 0, 24876, 24876, 'INR', 1, 'website', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'karan.brown1@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00288', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10024'), g.id, '2026-01-07', '2026-01-08', 2, 3, 0, 29252, 29252, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'sneha.iyer88@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00289', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10035'), g.id, '2026-02-11', '2026-02-14', 3, 3, 0, 20702.5, 245, 'USD', 84.5, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'arjun.iyer6@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00290', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10008'), g.id, '2026-05-14', '2026-05-18', 3, 4, 0, 5875, 5875, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'aditya.patel25@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00291', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10036'), g.id, '2026-06-29', '2026-07-04', 3, 1, 0, 21139, 21139, 'INR', 1, 'direct', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'nikhil.nair52@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00292', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10026'), g.id, '2026-04-19', '2026-04-23', 3, 2, 2, 20315, 20315, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'nikhil.nair64@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00293', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10012'), g.id, '2026-07-31', '2026-08-02', 2, 3, 2, 18863, 18863, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'sarah.desai9@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00294', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10020'), g.id, '2026-10-02', '2026-10-03', 2, 1, 2, 13345, 13345, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'karan.desai63@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00295', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10018'), g.id, '2026-05-04', '2026-05-10', 3, 3, 2, 9913, 9913, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'pooja.singh39@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00296', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10054'), g.id, '2026-10-22', '2026-10-28', 1, 3, 1, 26590, 26590, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'aditya.nair63@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00297', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10021'), g.id, '2026-09-09', '2026-09-10', 2, 3, 0, 27239, 27239, 'INR', 1, 'ota', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'divya.patel91@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00298', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10026'), g.id, '2026-01-06', '2026-01-10', 3, 2, 0, 28925, 28925, 'INR', 1, 'ota', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'fatima.kapoor75@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00299', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10008'), g.id, '2026-04-11', '2026-04-17', 3, 4, 0, 24917, 24917, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'aarav.mehta65@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00300', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10027'), g.id, '2026-01-17', '2026-01-22', 2, 1, 0, 4957, 4957, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'hiroshi.menon85@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00301', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10024'), g.id, '2026-09-02', '2026-09-05', 1, 3, 0, 27570, 27570, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'fatima.gupta83@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00303', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10023'), g.id, '2026-10-12', '2026-10-17', 1, 3, 0, 10985, 130, 'USD', 84.5, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'hiroshi.rao28@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00304', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10003'), g.id, '2026-08-26', '2026-08-30', 2, 2, 0, 27768, 27768, 'INR', 1, 'direct', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'meera.kapoor87@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00305', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10020'), g.id, '2026-05-02', '2026-05-04', 3, 2, 0, 4277, 4277, 'INR', 1, 'website', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'lucas.menon61@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00306', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10035'), g.id, '2026-10-12', '2026-10-16', 2, 4, 0, 15605, 15605, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'meera.bose53@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00307', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10040'), g.id, '2026-05-03', '2026-05-05', 3, 3, 0, 16113, 16113, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'rahul.chen16@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00308', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10003'), g.id, '2026-10-26', '2026-10-29', 1, 2, 0, 6199, 6199, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'james.mehta57@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00310', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10034'), g.id, '2026-02-15', '2026-02-16', 1, 3, 0, 17117, 17117, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'lucas.menon61@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00312', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10025'), g.id, '2026-02-01', '2026-02-04', 2, 3, 0, 12420, 12420, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'daniel.joshi8@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00313', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10006'), g.id, '2026-10-23', '2026-10-27', 1, 1, 0, 26111, 26111, 'INR', 1, 'ota', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'hiroshi.khan69@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00314', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10032'), g.id, '2026-09-20', '2026-09-26', 3, 4, 2, 27728, 27728, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'nisha.bose20@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00315', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10038'), g.id, '2026-09-07', '2026-09-13', 2, 1, 0, 25295, 25295, 'INR', 1, 'direct', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'nisha.gupta74@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00316', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10021'), g.id, '2026-08-02', '2026-08-06', 1, 1, 2, 5331, 5331, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'tara.smith74@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00317', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10017'), g.id, '2026-06-09', '2026-06-11', 2, 3, 0, 7330, 7330, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'sneha.joshi28@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00318', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10028'), g.id, '2026-03-28', '2026-03-30', 2, 4, 0, 5129, 5129, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'divya.brown81@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00319', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10030'), g.id, '2026-10-13', '2026-10-18', 3, 2, 0, 9717.5, 115, 'USD', 84.5, 'website', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'meera.johnson55@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00320', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10010'), g.id, '2026-05-09', '2026-05-10', 2, 4, 0, 22456, 22456, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'aarav.gupta29@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00321', p.id, NULL, g.id, '2026-07-01', '2026-07-07', 2, 2, 0, 27040, 320, 'USD', 84.5, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'lucas.menon61@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00322', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10018'), g.id, '2026-01-18', '2026-01-22', 3, 2, 0, 6048, 6048, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'nikhil.tanaka72@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00323', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10018'), g.id, '2026-03-23', '2026-03-24', 2, 1, 2, 25901, 25901, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'rahul.gupta4@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00324', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10017'), g.id, '2026-04-29', '2026-05-04', 1, 1, 0, 7739, 7739, 'INR', 1, 'ota', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'lucas.patel2@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00326', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10030'), g.id, '2026-04-24', '2026-04-29', 2, 3, 2, 20047, 20047, 'INR', 1, 'website', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'rahul.mehta18@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00327', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10039'), g.id, '2026-04-16', '2026-04-21', 3, 1, 2, 9034, 9034, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'nisha.chen53@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00328', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10022'), g.id, '2026-04-28', '2026-05-04', 3, 2, 0, 14748, 14748, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'rohan.johnson41@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00329', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10006'), g.id, '2026-10-10', '2026-10-14', 2, 3, 2, 17745, 210, 'USD', 84.5, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'karan.smith49@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00330', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10011'), g.id, '2026-06-11', '2026-06-15', 2, 4, 0, 21125, 250, 'USD', 84.5, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'wei.gupta94@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00331', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10005'), g.id, '2026-03-05', '2026-03-06', 3, 2, 0, 16673, 16673, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'sarah.rao90@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00332', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10026'), g.id, '2026-10-17', '2026-10-18', 3, 4, 0, 26402, 26402, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'nikhil.johnson5@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00333', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10001'), g.id, '2026-03-23', '2026-03-26', 1, 2, 0, 14311, 14311, 'INR', 1, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'fatima.chen31@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00334', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10069'), g.id, '2026-02-19', '2026-02-25', 1, 2, 0, 12675, 150, 'USD', 84.5, 'ota', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'divya.rao5@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00335', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10047'), g.id, '2026-02-22', '2026-02-27', 1, 1, 0, 9160, 9160, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'pooja.bose94@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00336', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10032'), g.id, '2026-06-07', '2026-06-09', 2, 2, 2, 12695, 12695, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'isha.joshi88@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00337', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10035'), g.id, '2026-07-03', '2026-07-05', 1, 2, 0, 16526, 16526, 'INR', 1, 'direct', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'sneha.joshi28@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00338', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10024'), g.id, '2026-07-01', '2026-07-07', 3, 1, 0, 22815, 270, 'USD', 84.5, 'walk_in', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'sanjay.menon57@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00339', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10028'), g.id, '2026-01-02', '2026-01-05', 3, 4, 0, 8443, 8443, 'INR', 1, 'walk_in', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'karan.smith49@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00340', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10035'), g.id, '2026-07-25', '2026-07-28', 2, 4, 1, 22392.5, 265, 'USD', 84.5, 'phone', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'kavya.brown63@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00341', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10041'), g.id, '2026-03-27', '2026-03-28', 1, 4, 0, 8953, 8953, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'pooja.smith64@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00342', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10015'), g.id, '2026-10-19', '2026-10-25', 3, 1, 0, 23053, 23053, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'karan.brown1@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00343', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10025'), g.id, '2026-02-05', '2026-02-06', 1, 3, 2, 14365, 170, 'USD', 84.5, 'ota', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'olivia.khan64@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00344', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10015'), g.id, '2026-04-03', '2026-04-08', 1, 3, 0, 27594, 27594, 'INR', 1, 'walk_in', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'divya.smith34@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00346', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10031'), g.id, '2026-06-17', '2026-06-21', 2, 1, 0, 12268, 12268, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'lucas.sharma66@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00347', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10013'), g.id, '2026-01-27', '2026-01-28', 2, 3, 0, 5322, 5322, 'INR', 1, 'phone', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'pooja.bose58@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00348', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10013'), g.id, '2026-10-14', '2026-10-15', 1, 2, 0, 5492.5, 65, 'USD', 84.5, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'karan.brown1@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00349', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10025'), g.id, '2026-06-25', '2026-06-26', 3, 4, 0, 10853, 10853, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'wei.singh90@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00350', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10030'), g.id, '2026-02-26', '2026-03-01', 1, 1, 0, 6446, 6446, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'rohan.chen27@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00351', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10022'), g.id, '2026-09-01', '2026-09-02', 3, 1, 0, 7112, 7112, 'INR', 1, 'direct', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'hiroshi.khan30@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00354', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10031'), g.id, '2026-06-10', '2026-06-15', 2, 2, 0, 18167.5, 215, 'USD', 84.5, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'lucas.joshi32@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00356', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10049'), g.id, '2026-05-12', '2026-05-16', 2, 4, 0, 8530, 8530, 'INR', 1, 'phone', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'vikram.kapoor10@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00357', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10026'), g.id, '2026-04-14', '2026-04-18', 2, 1, 0, 7635, 7635, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'hiroshi.menon85@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00358', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10034'), g.id, '2026-04-18', '2026-04-23', 2, 4, 0, 9388, 9388, 'INR', 1, 'website', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'sanjay.brown15@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00359', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10018'), g.id, '2026-04-11', '2026-04-15', 2, 1, 2, 11000, 11000, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'nisha.chen53@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00360', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10031'), g.id, '2026-04-20', '2026-04-24', 3, 2, 1, 13780, 13780, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'meera.kapoor87@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00361', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10020'), g.id, '2026-02-02', '2026-02-07', 3, 1, 0, 26273, 26273, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'wei.sharma49@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00362', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10022'), g.id, '2026-05-27', '2026-05-28', 3, 2, 0, 10821, 10821, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'pooja.singh39@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00363', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10028'), g.id, '2026-09-09', '2026-09-12', 2, 3, 0, 17745, 210, 'USD', 84.5, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'james.chen5@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00364', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10005'), g.id, '2026-08-31', '2026-09-03', 2, 1, 0, 16550, 16550, 'INR', 1, 'website', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'pooja.bose58@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00365', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10003'), g.id, '2026-07-29', '2026-07-31', 3, 4, 1, 5424, 5424, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'hiroshi.sharma98@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00366', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10011'), g.id, '2026-09-11', '2026-09-17', 2, 4, 0, 4614, 4614, 'INR', 1, 'direct', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'divya.bose14@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00367', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10025'), g.id, '2026-04-29', '2026-05-05', 2, 1, 0, 22737, 22737, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'wei.tanaka25@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00368', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10040'), g.id, '2026-03-14', '2026-03-19', 1, 1, 0, 15897, 15897, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'karan.verma8@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00370', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10040'), g.id, '2026-10-22', '2026-10-23', 1, 4, 0, 29257, 29257, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'pooja.gupta98@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00371', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10007'), g.id, '2026-08-12', '2026-08-18', 3, 1, 0, 7795, 7795, 'INR', 1, 'phone', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'sarah.rao90@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00372', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10026'), g.id, '2026-02-14', '2026-02-16', 1, 4, 0, 14263, 14263, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'tara.verma48@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00374', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10019'), g.id, '2026-08-17', '2026-08-18', 3, 4, 1, 16055, 190, 'USD', 84.5, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'vikram.iyer45@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00375', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10008'), g.id, '2026-04-22', '2026-04-26', 2, 2, 0, 5505, 5505, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'rohan.chen37@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00376', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10016'), g.id, '2026-06-08', '2026-06-13', 3, 1, 0, 14111, 14111, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'vikram.khan26@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00377', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10017'), g.id, '2026-10-09', '2026-10-15', 3, 2, 0, 20156, 20156, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'pooja.singh39@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00378', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10029'), g.id, '2026-09-25', '2026-09-29', 1, 2, 0, 13097.5, 155, 'USD', 84.5, 'direct', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'aditya.kapoor57@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00379', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10008'), g.id, '2026-05-07', '2026-05-13', 1, 4, 0, 7950, 7950, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'meera.joshi3@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00380', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10065'), g.id, '2026-06-26', '2026-06-29', 3, 3, 0, 19574, 19574, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'sarah.reddy28@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00381', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10033'), g.id, '2026-04-19', '2026-04-21', 3, 1, 2, 29376, 29376, 'INR', 1, 'website', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'ananya.brown53@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00382', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10029'), g.id, '2026-04-30', '2026-05-02', 3, 2, 0, 17871, 17871, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'karan.chen27@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00383', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10017'), g.id, '2026-09-01', '2026-09-07', 2, 2, 0, 27612, 27612, 'INR', 1, 'website', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'rohan.mehta75@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00384', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10053'), g.id, '2026-06-02', '2026-06-06', 3, 1, 0, 20952, 20952, 'INR', 1, 'ota', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'ananya.mehta65@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00385', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10015'), g.id, '2026-04-11', '2026-04-12', 2, 1, 0, 7325, 7325, 'INR', 1, 'website', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'hiroshi.gupta57@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00386', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10011'), g.id, '2026-09-17', '2026-09-19', 2, 4, 1, 15792, 15792, 'INR', 1, 'direct', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'ananya.gupta47@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00387', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10020'), g.id, '2026-03-22', '2026-03-24', 2, 3, 0, 24335, 24335, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'rahul.chen16@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00388', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10012'), g.id, '2026-09-23', '2026-09-27', 1, 1, 0, 26319, 26319, 'INR', 1, 'phone', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'hiroshi.johnson40@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00389', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10006'), g.id, '2026-01-18', '2026-01-22', 2, 4, 0, 10161, 10161, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'ananya.brown38@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00390', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10030'), g.id, '2026-07-05', '2026-07-07', 1, 2, 0, 16732, 16732, 'INR', 1, 'direct', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'sanjay.menon57@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00391', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10011'), g.id, '2026-06-22', '2026-06-24', 2, 1, 0, 5222, 5222, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'vikram.johnson72@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00392', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10009'), g.id, '2026-08-25', '2026-08-28', 2, 3, 0, 17941, 17941, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'pooja.smith64@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00393', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10029'), g.id, '2026-06-03', '2026-06-06', 3, 1, 0, 24407, 24407, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'karan.chen27@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00394', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10025'), g.id, '2026-02-26', '2026-03-04', 2, 4, 1, 16800, 16800, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'fatima.menon65@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00395', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10020'), g.id, '2026-08-07', '2026-08-09', 3, 1, 1, 17322.5, 205, 'USD', 84.5, 'phone', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'vikram.brown9@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00396', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10021'), g.id, '2026-09-06', '2026-09-10', 3, 1, 0, 28730, 340, 'USD', 84.5, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'divya.smith34@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00397', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10014'), g.id, '2026-06-03', '2026-06-08', 3, 3, 0, 16266, 16266, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'ananya.gupta81@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00398', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10019'), g.id, '2026-07-02', '2026-07-06', 2, 2, 2, 19719, 19719, 'INR', 1, 'direct', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'meera.joshi3@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00399', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10026'), g.id, '2026-09-16', '2026-09-17', 2, 1, 0, 5605, 5605, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'divya.smith34@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00401', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10047'), g.id, '2026-03-25', '2026-03-27', 2, 4, 0, 16869, 16869, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'yuki.gupta65@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00402', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10014'), g.id, '2026-08-08', '2026-08-10', 1, 4, 0, 13397, 13397, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'lucas.patel2@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00403', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10064'), g.id, '2026-06-12', '2026-06-15', 1, 3, 2, 16300, 16300, 'INR', 1, 'walk_in', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'tara.verma48@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00404', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10038'), g.id, '2026-06-11', '2026-06-13', 3, 1, 0, 18590, 220, 'USD', 84.5, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'wei.singh90@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00405', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10005'), g.id, '2026-02-05', '2026-02-10', 1, 2, 0, 14523, 14523, 'INR', 1, 'direct', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'pooja.gupta70@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00406', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10021'), g.id, '2026-07-23', '2026-07-29', 3, 4, 0, 24647, 24647, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'sarah.desai9@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00407', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10040'), g.id, '2026-08-12', '2026-08-15', 3, 4, 0, 11956, 11956, 'INR', 1, 'direct', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'kavya.bose97@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00409', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10012'), g.id, '2026-09-11', '2026-09-12', 3, 3, 0, 5652, 5652, 'INR', 1, 'walk_in', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'hiroshi.menon85@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00410', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10062'), g.id, '2026-07-09', '2026-07-13', 2, 4, 0, 19857.5, 235, 'USD', 84.5, 'direct', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'rahul.mehta18@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00412', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10004'), g.id, '2026-02-22', '2026-02-23', 1, 3, 0, 14927, 14927, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'olivia.johnson39@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00413', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10012'), g.id, '2026-03-20', '2026-03-25', 1, 4, 0, 13367, 13367, 'INR', 1, 'ota', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'tara.tanaka53@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00414', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10039'), g.id, '2026-06-23', '2026-06-26', 2, 3, 0, 23702, 23702, 'INR', 1, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'olivia.khan27@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00415', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10022'), g.id, '2026-01-01', '2026-01-02', 3, 2, 0, 17322.5, 205, 'USD', 84.5, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'nikhil.kapoor67@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00416', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10029'), g.id, '2026-09-08', '2026-09-10', 2, 4, 0, 19016, 19016, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'sarah.reddy28@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00417', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10038'), g.id, '2026-07-01', '2026-07-07', 1, 4, 0, 5070, 60, 'USD', 84.5, 'direct', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'rahul.verma37@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00418', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10015'), g.id, '2026-03-09', '2026-03-13', 2, 2, 0, 19154, 19154, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'divya.smith34@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00420', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10008'), g.id, '2026-03-05', '2026-03-07', 1, 1, 0, 12897, 12897, 'INR', 1, 'direct', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'rahul.chen16@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00421', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10005'), g.id, '2026-10-21', '2026-10-24', 2, 2, 1, 29398, 29398, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'nisha.mehta92@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00422', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10039'), g.id, '2026-06-07', '2026-06-11', 3, 1, 0, 13827, 13827, 'INR', 1, 'website', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'vikram.johnson72@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00423', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10045'), g.id, '2026-07-14', '2026-07-18', 1, 2, 0, 12236, 12236, 'INR', 1, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'rahul.smith11@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00424', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10057'), g.id, '2026-09-19', '2026-09-23', 2, 4, 0, 4288, 4288, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'nikhil.reddy93@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00426', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10020'), g.id, '2026-04-09', '2026-04-10', 3, 1, 2, 29118, 29118, 'INR', 1, 'ota', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'meera.kapoor87@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00427', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10023'), g.id, '2026-03-04', '2026-03-05', 2, 3, 0, 15163, 15163, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'lucas.verma94@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00428', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10031'), g.id, '2026-04-06', '2026-04-10', 1, 1, 0, 9717.5, 115, 'USD', 84.5, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'divya.smith34@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00429', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10002'), g.id, '2026-02-16', '2026-02-19', 1, 4, 0, 17417, 17417, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'nikhil.joshi54@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00430', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10034'), g.id, '2026-03-10', '2026-03-13', 3, 4, 0, 9910, 9910, 'INR', 1, 'walk_in', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'meera.joshi59@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00431', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10014'), g.id, '2026-08-18', '2026-08-24', 2, 2, 0, 28220, 28220, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'karan.verma72@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00432', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10009'), g.id, '2026-10-24', '2026-10-30', 2, 4, 0, 11039, 11039, 'INR', 1, 'phone', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'daniel.patel39@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00433', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10020'), g.id, '2026-09-04', '2026-09-10', 1, 3, 0, 28278, 28278, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'tara.smith74@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00434', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10029'), g.id, '2026-09-30', '2026-10-05', 3, 1, 0, 16719, 16719, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'aarav.tanaka3@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00435', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10004'), g.id, '2026-01-15', '2026-01-19', 1, 1, 2, 21585, 21585, 'INR', 1, 'website', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'pooja.gupta98@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00436', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10019'), g.id, '2026-01-01', '2026-01-06', 1, 2, 0, 22413, 22413, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'fatima.chen31@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00437', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10025'), g.id, '2026-10-06', '2026-10-11', 2, 2, 0, 25142, 25142, 'INR', 1, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'ananya.brown53@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00438', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10021'), g.id, '2026-08-11', '2026-08-14', 1, 2, 0, 14787.5, 175, 'USD', 84.5, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'aarav.rao59@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00439', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10024'), g.id, '2026-04-08', '2026-04-09', 2, 3, 0, 14908, 14908, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'kavya.verma44@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00440', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10015'), g.id, '2026-06-20', '2026-06-21', 3, 3, 1, 24927.5, 295, 'USD', 84.5, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'isha.sharma12@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00442', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10012'), g.id, '2026-07-08', '2026-07-13', 2, 2, 0, 14459, 14459, 'INR', 1, 'ota', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'nikhil.desai79@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00443', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10039'), g.id, '2026-02-20', '2026-02-25', 3, 4, 0, 23394, 23394, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'lucas.patel2@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00444', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10005'), g.id, '2026-02-27', '2026-03-01', 1, 2, 0, 4327, 4327, 'INR', 1, 'direct', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'kavya.gupta51@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00445', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10010'), g.id, '2026-08-31', '2026-09-03', 3, 1, 0, 11492, 11492, 'INR', 1, 'direct', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'fatima.patel10@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00446', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10013'), g.id, '2026-08-16', '2026-08-17', 2, 2, 2, 22884, 22884, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'isha.tanaka58@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00447', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10010'), g.id, '2026-07-24', '2026-07-25', 2, 3, 0, 14683, 14683, 'INR', 1, 'direct', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'lucas.sharma66@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00448', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10058'), g.id, '2026-06-22', '2026-06-26', 3, 1, 0, 4373, 4373, 'INR', 1, 'direct', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'olivia.sharma55@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00449', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10029'), g.id, '2026-05-04', '2026-05-09', 1, 1, 0, 9255, 9255, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'meera.bose53@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00450', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10008'), g.id, '2026-07-27', '2026-07-28', 3, 2, 2, 16882, 16882, 'INR', 1, 'phone', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'sneha.joshi28@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00452', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10011'), g.id, '2026-09-08', '2026-09-12', 3, 3, 0, 28307.5, 335, 'USD', 84.5, 'phone', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'divya.bose14@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00453', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10027'), g.id, '2026-05-11', '2026-05-15', 3, 3, 2, 4541, 4541, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'hiroshi.menon85@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00454', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10025'), g.id, '2026-05-25', '2026-05-27', 2, 4, 2, 15746, 15746, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'hiroshi.sharma98@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00455', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10006'), g.id, '2026-10-03', '2026-10-04', 1, 3, 0, 24318, 24318, 'INR', 1, 'phone', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'ananya.brown53@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00456', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10016'), g.id, '2026-10-08', '2026-10-14', 1, 2, 0, 6447, 6447, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'isha.patel77@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00457', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10014'), g.id, '2026-04-01', '2026-04-05', 3, 1, 0, 17580, 17580, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'vikram.kapoor18@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00458', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10048'), g.id, '2026-06-12', '2026-06-18', 1, 4, 0, 29482, 29482, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'pooja.bose94@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00459', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10033'), g.id, '2026-05-18', '2026-05-19', 1, 3, 0, 27040, 320, 'USD', 84.5, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'nisha.mehta14@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00460', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10006'), g.id, '2026-07-15', '2026-07-16', 3, 1, 1, 27169, 27169, 'INR', 1, 'walk_in', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'nikhil.mehta58@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00461', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10010'), g.id, '2026-08-30', '2026-09-03', 1, 3, 0, 25006, 25006, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'rohan.iyer3@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00462', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10004'), g.id, '2026-05-29', '2026-06-01', 3, 1, 1, 6316, 6316, 'INR', 1, 'walk_in', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'yuki.menon34@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00463', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10036'), g.id, '2026-09-12', '2026-09-16', 1, 4, 0, 26162, 26162, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'lucas.joshi39@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00464', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10025'), g.id, '2026-06-01', '2026-06-07', 2, 4, 0, 25112, 25112, 'INR', 1, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'wei.tanaka25@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00465', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10040'), g.id, '2026-01-13', '2026-01-18', 2, 2, 1, 13778, 13778, 'INR', 1, 'walk_in', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'emma.johnson64@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00466', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10048'), g.id, '2026-05-23', '2026-05-26', 3, 3, 0, 13346, 13346, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'aarav.tanaka3@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00467', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10042'), g.id, '2026-07-04', '2026-07-06', 2, 1, 0, 22021, 22021, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'daniel.joshi8@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00468', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10012'), g.id, '2026-09-22', '2026-09-27', 2, 4, 0, 7862, 7862, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'hiroshi.sharma98@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00469', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10018'), g.id, '2026-06-25', '2026-06-28', 3, 4, 0, 25772.5, 305, 'USD', 84.5, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'vikram.sharma22@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00470', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10025'), g.id, '2026-07-14', '2026-07-17', 2, 1, 1, 12695, 12695, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'divya.gupta71@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00471', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10033'), g.id, '2026-05-24', '2026-05-26', 3, 2, 0, 29221, 29221, 'INR', 1, 'website', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'karan.chen27@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00472', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10029'), g.id, '2026-04-14', '2026-04-18', 2, 3, 2, 23068, 23068, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'lucas.johnson35@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00473', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10037'), g.id, '2026-08-01', '2026-08-02', 2, 2, 0, 28566, 28566, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'nikhil.bose49@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00474', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10015'), g.id, '2026-02-01', '2026-02-06', 1, 1, 0, 13097.5, 155, 'USD', 84.5, 'walk_in', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'vikram.desai82@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00475', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10026'), g.id, '2026-06-08', '2026-06-13', 2, 3, 0, 14895, 14895, 'INR', 1, 'walk_in', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'sanjay.menon57@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00476', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10058'), g.id, '2026-03-29', '2026-04-02', 3, 3, 0, 22598, 22598, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'karan.brown1@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00477', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10005'), g.id, '2026-03-21', '2026-03-26', 1, 1, 0, 16672, 16672, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'lucas.joshi32@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00478', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10013'), g.id, '2026-10-07', '2026-10-11', 3, 3, 0, 14570, 14570, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'karan.bose10@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00479', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10009'), g.id, '2026-05-07', '2026-05-10', 3, 1, 0, 28063, 28063, 'INR', 1, 'walk_in', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'james.chen5@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00480', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10026'), g.id, '2026-05-09', '2026-05-14', 3, 2, 1, 27593, 27593, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'sarah.desai9@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00482', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10010'), g.id, '2026-10-02', '2026-10-06', 2, 1, 0, 14028, 14028, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'pooja.gupta70@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00483', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10003'), g.id, '2026-08-11', '2026-08-16', 1, 2, 2, 29575, 350, 'USD', 84.5, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'vikram.brown9@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00484', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10033'), g.id, '2026-07-06', '2026-07-08', 3, 3, 0, 5271, 5271, 'INR', 1, 'website', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'nikhil.kapoor67@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00485', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10054'), g.id, '2026-07-20', '2026-07-21', 2, 1, 1, 17332, 17332, 'INR', 1, 'walk_in', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'rohan.mehta75@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00486', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10019'), g.id, '2026-10-27', '2026-10-29', 3, 3, 0, 16477.5, 195, 'USD', 84.5, 'direct', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'yuki.sharma49@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00487', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10009'), g.id, '2026-04-08', '2026-04-10', 2, 2, 0, 27934, 27934, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'pooja.gupta98@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00488', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10038'), g.id, '2026-03-09', '2026-03-10', 3, 2, 0, 26195, 310, 'USD', 84.5, 'ota', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'tara.nair14@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00489', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10021'), g.id, '2026-09-11', '2026-09-16', 2, 2, 1, 10280, 10280, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'ananya.patel93@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00490', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10012'), g.id, '2026-01-29', '2026-02-01', 2, 4, 0, 26771, 26771, 'INR', 1, 'ota', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'yuki.sharma49@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00491', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10024'), g.id, '2026-07-17', '2026-07-19', 1, 4, 0, 6322, 6322, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'rahul.gupta4@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00492', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10028'), g.id, '2026-08-10', '2026-08-14', 1, 2, 0, 11892, 11892, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'daniel.patel39@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00493', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10041'), g.id, '2026-06-24', '2026-06-26', 2, 3, 0, 13458, 13458, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'james.chen5@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00494', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10040'), g.id, '2026-08-15', '2026-08-16', 1, 3, 0, 11284, 11284, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'kabir.verma64@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00495', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10026'), g.id, '2026-06-29', '2026-07-05', 3, 3, 1, 29586, 29586, 'INR', 1, 'direct', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'aarav.rao59@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00496', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10040'), g.id, '2026-03-23', '2026-03-24', 1, 1, 0, 5203, 5203, 'INR', 1, 'direct', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'vikram.rao95@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00497', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10005'), g.id, '2026-01-15', '2026-01-18', 1, 4, 1, 19857.5, 235, 'USD', 84.5, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'lucas.joshi32@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00498', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10025'), g.id, '2026-04-08', '2026-04-14', 2, 2, 0, 21653, 21653, 'INR', 1, 'ota', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'nisha.gupta74@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00499', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10006'), g.id, '2026-04-30', '2026-05-01', 1, 4, 0, 8204, 8204, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'lucas.menon61@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00500', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10030'), g.id, '2026-05-04', '2026-05-09', 3, 2, 0, 4961, 4961, 'INR', 1, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'nisha.mehta14@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00501', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10009'), g.id, '2026-05-03', '2026-05-09', 3, 4, 0, 13097.5, 155, 'USD', 84.5, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'vikram.khan26@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00502', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10001'), g.id, '2026-09-26', '2026-10-02', 3, 2, 0, 19462, 19462, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'ananya.reddy65@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00503', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10011'), g.id, '2026-01-06', '2026-01-11', 3, 4, 0, 25766, 25766, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'divya.smith34@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00504', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10027'), g.id, '2026-01-07', '2026-01-09', 2, 1, 0, 13670, 13670, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'pooja.bose94@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00505', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10002'), g.id, '2026-09-10', '2026-09-15', 2, 1, 1, 14372, 14372, 'INR', 1, 'ota', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'sarah.reddy28@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00506', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10002'), g.id, '2026-07-08', '2026-07-14', 1, 2, 0, 17765, 17765, 'INR', 1, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'kavya.gupta72@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00507', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10033'), g.id, '2026-06-06', '2026-06-10', 2, 2, 0, 27040, 320, 'USD', 84.5, 'phone', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'sarah.tanaka69@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00508', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10004'), g.id, '2026-03-04', '2026-03-06', 3, 4, 1, 15064, 15064, 'INR', 1, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'sneha.iyer88@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00509', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10013'), g.id, '2026-07-23', '2026-07-26', 1, 2, 1, 12051, 12051, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'wei.gupta94@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00510', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10010'), g.id, '2026-01-11', '2026-01-12', 3, 1, 2, 14787.5, 175, 'USD', 84.5, 'phone', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'priya.iyer18@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00511', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10003'), g.id, '2026-08-20', '2026-08-26', 1, 3, 0, 4127, 4127, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'fatima.patel10@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00512', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10052'), g.id, '2026-04-05', '2026-04-10', 3, 4, 0, 24505, 290, 'USD', 84.5, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'daniel.patel39@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00513', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10001'), g.id, '2026-06-03', '2026-06-04', 2, 1, 0, 19900, 19900, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'arjun.brown67@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00514', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10031'), g.id, '2026-10-08', '2026-10-09', 1, 4, 0, 10985, 130, 'USD', 84.5, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'ananya.menon37@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00515', p.id, NULL, g.id, '2026-07-03', '2026-07-09', 2, 1, 0, 25099, 25099, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'yuki.sharma49@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00516', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10012'), g.id, '2026-02-12', '2026-02-14', 3, 3, 0, 15632.5, 185, 'USD', 84.5, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'fatima.nair11@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00517', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10067'), g.id, '2026-10-04', '2026-10-08', 3, 1, 0, 21583, 21583, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'wei.gupta94@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00518', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10009'), g.id, '2026-05-08', '2026-05-11', 1, 2, 1, 27195, 27195, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'vikram.khan26@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00519', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10010'), g.id, '2026-08-09', '2026-08-13', 1, 1, 0, 24822, 24822, 'INR', 1, 'walk_in', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'wei.gupta94@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00520', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10032'), g.id, '2026-02-20', '2026-02-23', 1, 4, 1, 16989, 16989, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'rohan.iyer3@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00521', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10033'), g.id, '2026-08-17', '2026-08-21', 3, 3, 0, 9717.5, 115, 'USD', 84.5, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'tara.verma48@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00522', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10008'), g.id, '2026-10-06', '2026-10-12', 2, 1, 2, 9522, 9522, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'fatima.patel10@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00524', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10011'), g.id, '2026-01-03', '2026-01-04', 1, 1, 0, 11431, 11431, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'vikram.desai82@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00525', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10005'), g.id, '2026-09-05', '2026-09-10', 1, 3, 2, 15698, 15698, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'fatima.patel10@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00526', p.id, NULL, g.id, '2026-02-17', '2026-02-23', 2, 3, 0, 28332, 28332, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'ananya.gupta81@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00527', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10010'), g.id, '2026-01-23', '2026-01-24', 2, 4, 0, 28042, 28042, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'pooja.iyer60@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00528', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10029'), g.id, '2026-01-19', '2026-01-20', 2, 2, 0, 12169, 12169, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'yuki.sharma49@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00529', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10042'), g.id, '2026-06-17', '2026-06-19', 3, 3, 2, 5915, 70, 'USD', 84.5, 'website', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'vikram.johnson72@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00530', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10027'), g.id, '2026-06-05', '2026-06-09', 1, 3, 0, 10783, 10783, 'INR', 1, 'website', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'emma.johnson17@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00531', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10032'), g.id, '2026-10-14', '2026-10-19', 1, 3, 0, 10074, 10074, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'yuki.bose10@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00532', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10006'), g.id, '2026-10-04', '2026-10-06', 2, 4, 0, 4176, 4176, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'daniel.patel39@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00533', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10027'), g.id, '2026-08-26', '2026-08-27', 1, 3, 0, 24927.5, 295, 'USD', 84.5, 'direct', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'sarah.rao90@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00534', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10049'), g.id, '2026-06-16', '2026-06-20', 3, 4, 0, 19066, 19066, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'priya.iyer18@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00535', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10047'), g.id, '2026-03-31', '2026-04-06', 1, 4, 0, 8835, 8835, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'isha.smith4@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00536', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10036'), g.id, '2026-01-27', '2026-02-02', 2, 2, 0, 25350, 300, 'USD', 84.5, 'phone', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'olivia.khan64@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00537', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10003'), g.id, '2026-09-03', '2026-09-07', 3, 1, 0, 12308, 12308, 'INR', 1, 'ota', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'rahul.gupta38@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00540', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10034'), g.id, '2026-08-24', '2026-08-28', 3, 2, 0, 27257, 27257, 'INR', 1, 'direct', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'tara.singh74@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00541', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10024'), g.id, '2026-09-26', '2026-09-28', 3, 4, 0, 26617.5, 315, 'USD', 84.5, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'aarav.bose7@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00542', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10039'), g.id, '2026-03-30', '2026-04-03', 1, 1, 0, 12476, 12476, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'wei.nair97@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00543', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10057'), g.id, '2026-06-18', '2026-06-23', 1, 1, 0, 19127, 19127, 'INR', 1, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'vikram.bose89@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00544', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10025'), g.id, '2026-04-01', '2026-04-06', 3, 1, 2, 6865, 6865, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'sarah.reddy28@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00545', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10045'), g.id, '2026-08-28', '2026-09-03', 1, 3, 1, 5780, 5780, 'INR', 1, 'website', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'vikram.brown9@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00546', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10040'), g.id, '2026-07-29', '2026-07-31', 2, 4, 0, 10822, 10822, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'james.gupta58@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00547', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10016'), g.id, '2026-04-05', '2026-04-07', 2, 4, 0, 26586, 26586, 'INR', 1, 'ota', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'aditya.patel25@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00548', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10022'), g.id, '2026-04-26', '2026-04-29', 3, 4, 1, 17322.5, 205, 'USD', 84.5, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'rahul.rao43@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00549', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10028'), g.id, '2026-01-12', '2026-01-14', 1, 2, 0, 11932, 11932, 'INR', 1, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'sarah.verma95@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00550', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10022'), g.id, '2026-10-19', '2026-10-25', 3, 4, 0, 23128, 23128, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'emma.tanaka45@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00551', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10020'), g.id, '2026-10-03', '2026-10-08', 3, 1, 0, 7561, 7561, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'wei.nair97@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00552', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10007'), g.id, '2026-01-21', '2026-01-22', 2, 4, 0, 8520, 8520, 'INR', 1, 'direct', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'ananya.gupta47@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00553', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10001'), g.id, '2026-03-12', '2026-03-13', 2, 1, 0, 28653, 28653, 'INR', 1, 'walk_in', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'ananya.mehta65@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00554', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10027'), g.id, '2026-01-30', '2026-02-03', 2, 1, 0, 20978, 20978, 'INR', 1, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'olivia.kapoor46@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00555', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10004'), g.id, '2026-05-22', '2026-05-25', 2, 3, 0, 24701, 24701, 'INR', 1, 'direct', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'olivia.brown88@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00556', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10007'), g.id, '2026-06-24', '2026-06-30', 3, 4, 0, 14552, 14552, 'INR', 1, 'direct', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'daniel.joshi8@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00557', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10034'), g.id, '2026-02-24', '2026-03-02', 3, 3, 2, 28548, 28548, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'yuki.sharma49@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00558', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10027'), g.id, '2026-02-28', '2026-03-03', 2, 1, 0, 11992, 11992, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'vikram.sharma22@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00559', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10019'), g.id, '2026-05-12', '2026-05-16', 2, 3, 0, 25560, 25560, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'nikhil.tanaka72@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00560', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10036'), g.id, '2026-08-29', '2026-08-30', 3, 4, 2, 26228, 26228, 'INR', 1, 'direct', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'aarav.rao59@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00561', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10002'), g.id, '2026-07-30', '2026-08-02', 1, 2, 0, 17016, 17016, 'INR', 1, 'ota', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'hiroshi.johnson40@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00562', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10018'), g.id, '2026-02-02', '2026-02-06', 3, 1, 1, 13097.5, 155, 'USD', 84.5, 'website', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'nikhil.bose49@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00563', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10050'), g.id, '2026-04-11', '2026-04-17', 3, 4, 1, 23660, 280, 'USD', 84.5, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'divya.bose14@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00564', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10001'), g.id, '2026-03-14', '2026-03-16', 1, 1, 0, 27011, 27011, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'nisha.reddy32@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00565', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10020'), g.id, '2026-01-05', '2026-01-06', 3, 2, 0, 9350, 9350, 'INR', 1, 'walk_in', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'hiroshi.menon85@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00566', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10015'), g.id, '2026-08-26', '2026-08-27', 3, 2, 0, 15923, 15923, 'INR', 1, 'direct', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'nikhil.reddy17@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00567', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10040'), g.id, '2026-04-15', '2026-04-17', 1, 3, 1, 11830, 140, 'USD', 84.5, 'walk_in', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'rahul.sharma82@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00568', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10006'), g.id, '2026-02-28', '2026-03-01', 1, 1, 0, 10530, 10530, 'INR', 1, 'walk_in', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'isha.gupta26@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00569', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10004'), g.id, '2026-08-23', '2026-08-27', 1, 3, 0, 23660, 280, 'USD', 84.5, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'lucas.reddy43@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00570', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10015'), g.id, '2026-08-23', '2026-08-28', 2, 3, 0, 9331, 9331, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'hiroshi.khan69@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00571', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10049'), g.id, '2026-05-20', '2026-05-23', 1, 1, 0, 29325, 29325, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'daniel.verma4@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00572', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10023'), g.id, '2026-03-10', '2026-03-15', 3, 2, 0, 14918, 14918, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'arjun.brown67@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00573', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10014'), g.id, '2026-04-28', '2026-05-02', 3, 4, 1, 28595, 28595, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'james.chen5@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00574', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10043'), g.id, '2026-02-05', '2026-02-07', 1, 3, 1, 20281, 20281, 'INR', 1, 'walk_in', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'karan.smith49@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00575', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10024'), g.id, '2026-08-27', '2026-08-30', 3, 3, 0, 8216, 8216, 'INR', 1, 'direct', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'aarav.bose7@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00576', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10022'), g.id, '2026-07-12', '2026-07-14', 1, 4, 1, 16053, 16053, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'ananya.brown38@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00577', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10036'), g.id, '2026-02-01', '2026-02-02', 3, 3, 0, 25350, 300, 'USD', 84.5, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'nikhil.mehta58@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00578', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10004'), g.id, '2026-08-15', '2026-08-20', 2, 2, 0, 5059, 5059, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'rahul.rao43@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00579', p.id, NULL, g.id, '2026-04-29', '2026-05-04', 3, 1, 0, 21526, 21526, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'rahul.rao43@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00580', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10049'), g.id, '2026-08-02', '2026-08-08', 2, 4, 2, 29408, 29408, 'INR', 1, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'emma.tanaka45@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00581', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10021'), g.id, '2026-03-28', '2026-04-03', 1, 2, 2, 18753, 18753, 'INR', 1, 'walk_in', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'kavya.gupta51@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00582', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10033'), g.id, '2026-02-09', '2026-02-10', 3, 4, 0, 12305, 12305, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'lucas.joshi39@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00583', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BAY' AND r.room_number = '10031'), g.id, '2026-02-20', '2026-02-26', 3, 2, 2, 11628, 11628, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-BAY' AND lower(g.email) = 'divya.patel61@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00584', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10018'), g.id, '2026-07-07', '2026-07-13', 2, 4, 0, 28424, 28424, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'vikram.johnson72@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00585', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10013'), g.id, '2026-06-16', '2026-06-17', 2, 4, 0, 9717.5, 115, 'USD', 84.5, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'meera.tanaka69@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00586', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10021'), g.id, '2026-08-15', '2026-08-17', 2, 3, 0, 7182.5, 85, 'USD', 84.5, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'ananya.brown53@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00587', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10004'), g.id, '2026-10-28', '2026-11-02', 3, 3, 0, 7369, 7369, 'INR', 1, 'phone', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'yuki.johnson8@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00588', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10031'), g.id, '2026-06-08', '2026-06-13', 3, 1, 0, 25024, 25024, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'vikram.kapoor18@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00589', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10011'), g.id, '2026-10-08', '2026-10-13', 1, 3, 1, 27040, 320, 'USD', 84.5, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'divya.bose14@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00590', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10012'), g.id, '2026-08-30', '2026-09-04', 2, 1, 0, 17702, 17702, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'emma.reddy13@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00591', p.id, NULL, g.id, '2026-09-07', '2026-09-11', 3, 4, 0, 29725, 29725, 'INR', 1, 'phone', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'nikhil.bose49@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00592', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10008'), g.id, '2026-01-20', '2026-01-23', 2, 3, 0, 24082.5, 285, 'USD', 84.5, 'walk_in', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'meera.bose53@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00593', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10034'), g.id, '2026-02-04', '2026-02-07', 3, 4, 0, 19713, 19713, 'INR', 1, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'emma.johnson17@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00594', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10004'), g.id, '2026-04-30', '2026-05-01', 1, 3, 0, 11599, 11599, 'INR', 1, 'walk_in', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'aarav.verma79@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00596', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10025'), g.id, '2026-08-30', '2026-09-05', 2, 1, 0, 11608, 11608, 'INR', 1, 'ota', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'kavya.singh18@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00597', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10028'), g.id, '2026-06-25', '2026-06-29', 2, 2, 0, 12923, 12923, 'INR', 1, 'phone', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'vikram.singh69@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00598', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10014'), g.id, '2026-01-31', '2026-02-05', 2, 3, 2, 9873, 9873, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'aditya.sharma28@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00599', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10004'), g.id, '2026-03-01', '2026-03-05', 3, 1, 0, 22313, 22313, 'INR', 1, 'direct', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'nikhil.bose49@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00601', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10029'), g.id, '2026-04-28', '2026-05-01', 3, 4, 0, 18281, 18281, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'nikhil.nair52@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00602', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10016'), g.id, '2026-02-05', '2026-02-11', 2, 1, 0, 13939, 13939, 'INR', 1, 'website', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'ananya.kapoor42@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00603', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10002'), g.id, '2026-05-13', '2026-05-14', 1, 3, 0, 13274, 13274, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'ananya.brown38@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00604', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10028'), g.id, '2026-05-10', '2026-05-13', 3, 4, 2, 10140, 120, 'USD', 84.5, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'divya.reddy49@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00605', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10027'), g.id, '2026-03-21', '2026-03-22', 2, 4, 0, 13327, 13327, 'INR', 1, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'karan.smith49@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00606', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-POW' AND r.room_number = '10062'), g.id, '2026-10-24', '2026-10-29', 2, 2, 2, 22815, 270, 'USD', 84.5, 'phone', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-POW' AND lower(g.email) = 'rohan.iyer3@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00607', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10049'), g.id, '2026-03-15', '2026-03-16', 3, 1, 0, 5492.5, 65, 'USD', 84.5, 'website', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'rahul.sharma82@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00608', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10049'), g.id, '2026-05-04', '2026-05-10', 3, 1, 0, 29125, 29125, 'INR', 1, 'walk_in', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'priya.mehta98@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00609', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10006'), g.id, '2026-04-27', '2026-04-29', 3, 1, 0, 6521, 6521, 'INR', 1, 'direct', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'sarah.tanaka92@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00610', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10006'), g.id, '2026-08-13', '2026-08-16', 2, 2, 0, 20052, 20052, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'daniel.patel39@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00611', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10016'), g.id, '2026-02-12', '2026-02-16', 3, 3, 1, 13520, 160, 'USD', 84.5, 'direct', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'tara.singh74@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00612', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10029'), g.id, '2026-03-12', '2026-03-16', 3, 4, 0, 19012.5, 225, 'USD', 84.5, 'direct', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'hiroshi.menon85@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00613', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10031'), g.id, '2026-06-08', '2026-06-10', 3, 2, 2, 21468, 21468, 'INR', 1, 'phone', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'priya.mehta98@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00614', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10021'), g.id, '2026-10-04', '2026-10-10', 2, 2, 2, 4069, 4069, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'wei.iyer8@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00615', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10024'), g.id, '2026-07-18', '2026-07-21', 3, 4, 2, 17683, 17683, 'INR', 1, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'aditya.kapoor57@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00616', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10006'), g.id, '2026-02-08', '2026-02-11', 3, 4, 0, 4859, 4859, 'INR', 1, 'direct', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'karan.chen27@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00617', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10025'), g.id, '2026-10-21', '2026-10-26', 3, 4, 0, 26617.5, 315, 'USD', 84.5, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'isha.smith4@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00618', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10032'), g.id, '2026-02-15', '2026-02-16', 2, 4, 2, 27422, 27422, 'INR', 1, 'direct', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'tara.singh74@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00621', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CHE' AND r.room_number = '10039'), g.id, '2026-08-29', '2026-09-04', 1, 2, 0, 12347, 12347, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CHE' AND lower(g.email) = 'olivia.johnson39@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00622', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-WOR' AND r.room_number = '10009'), g.id, '2026-06-10', '2026-06-11', 2, 4, 0, 12252.5, 145, 'USD', 84.5, 'phone', 'cancelled'
     FROM properties p, guests g WHERE p.code = 'MUM-WOR' AND lower(g.email) = 'fatima.patel10@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00623', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10025'), g.id, '2026-03-25', '2026-03-31', 3, 2, 0, 20196, 20196, 'INR', 1, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'divya.rao5@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00624', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10016'), g.id, '2026-07-18', '2026-07-23', 2, 4, 0, 17027, 17027, 'INR', 1, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'vikram.rao95@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00625', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-GOR' AND r.room_number = '10022'), g.id, '2026-10-04', '2026-10-06', 1, 1, 0, 9295, 110, 'USD', 84.5, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-GOR' AND lower(g.email) = 'pooja.gupta70@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00626', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-LOW' AND r.room_number = '10011'), g.id, '2026-01-14', '2026-01-16', 1, 1, 0, 19266, 19266, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-LOW' AND lower(g.email) = 'rahul.sharma82@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00627', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10054'), g.id, '2026-06-15', '2026-06-20', 1, 4, 1, 9066, 9066, 'INR', 1, 'website', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'lucas.patel2@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00628', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MUL' AND r.room_number = '10006'), g.id, '2026-09-23', '2026-09-28', 1, 4, 0, 26682, 26682, 'INR', 1, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-MUL' AND lower(g.email) = 'emma.johnson17@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00629', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10013'), g.id, '2026-10-05', '2026-10-09', 3, 3, 0, 24451, 24451, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'nikhil.mehta58@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00630', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-JUH' AND r.room_number = '10047'), g.id, '2026-04-08', '2026-04-13', 1, 1, 0, 13055, 13055, 'INR', 1, 'direct', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-JUH' AND lower(g.email) = 'olivia.khan64@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00631', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10032'), g.id, '2026-08-02', '2026-08-03', 3, 4, 1, 8643, 8643, 'INR', 1, 'direct', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'nisha.chen53@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00632', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10007'), g.id, '2026-01-15', '2026-01-17', 1, 3, 0, 15329, 15329, 'INR', 1, 'ota', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'fatima.gupta83@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00633', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10030'), g.id, '2026-06-10', '2026-06-15', 3, 1, 0, 27017, 27017, 'INR', 1, 'website', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'divya.rao5@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00634', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-CSB' AND r.room_number = '10002'), g.id, '2026-05-14', '2026-05-15', 1, 2, 0, 29422, 29422, 'INR', 1, 'direct', 'pending'
     FROM properties p, guests g WHERE p.code = 'MUM-CSB' AND lower(g.email) = 'nikhil.tanaka72@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00635', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-DAD' AND r.room_number = '10008'), g.id, '2026-10-20', '2026-10-21', 3, 3, 0, 24505, 290, 'USD', 84.5, 'walk_in', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-DAD' AND lower(g.email) = 'yuki.sharma49@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00636', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-BOR' AND r.room_number = '10022'), g.id, '2026-07-21', '2026-07-25', 1, 1, 0, 20672, 20672, 'INR', 1, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-BOR' AND lower(g.email) = 'sneha.iyer88@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00637', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10001'), g.id, '2026-08-25', '2026-08-29', 2, 3, 0, 5070, 60, 'USD', 84.5, 'ota', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'vikram.verma59@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00638', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-AND' AND r.room_number = '10057'), g.id, '2026-03-22', '2026-03-23', 3, 3, 1, 6267, 6267, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-AND' AND lower(g.email) = 'karan.smith49@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00639', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-VER' AND r.room_number = '10014'), g.id, '2026-10-22', '2026-10-28', 1, 4, 0, 22780, 22780, 'INR', 1, 'walk_in', 'checked_out'
     FROM properties p, guests g WHERE p.code = 'MUM-VER' AND lower(g.email) = 'olivia.tanaka16@example.com'
     ON CONFLICT (reference) DO NOTHING;
INSERT INTO bookings (reference, property_id, room_id, guest_id, check_in, check_out, rooms_booked, adults, children, rate_inr, amount_original, currency_original, fx_rate, source, status)
     SELECT 'RAW-00640', p.id, (SELECT r.id FROM rooms r JOIN properties p ON p.id = r.property_id WHERE p.code = 'MUM-MAL' AND r.room_number = '10009'), g.id, '2026-01-03', '2026-01-05', 3, 3, 2, 16789, 16789, 'INR', 1, 'website', 'confirmed'
     FROM properties p, guests g WHERE p.code = 'MUM-MAL' AND lower(g.email) = 'rahul.gupta38@example.com'
     ON CONFLICT (reference) DO NOTHING;
-- reviews
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'sarah.patel10@example.com'), 4, 'Excellent service', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-WOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'fatima.menon65@example.com'), 4, 'Noisy at night', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-LOW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'olivia.kapoor46@example.com'), 3, 'Superb breakfast', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-CSB';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'kavya.bose97@example.com'), 4, 'Perfect for a short trip', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-GOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'ananya.mehta69@example.com'), 5, 'Perfect for a short trip', 'The property is charming but the walls are thin. Bring earplugs if you are a light sleeper.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'nikhil.tanaka72@example.com'), 4, 'Lovely stay', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-VER';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'kavya.desai96@example.com'), 4, 'Good value', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-MAL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'nikhil.johnson5@example.com'), 4, 'Would come back', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-POW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'nisha.chen26@example.com'), 1, 'Not as described', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'sarah.joshi26@example.com'), 2, 'Great location', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-AND';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'nikhil.reddy93@example.com'), 3, 'Superb breakfast', 'The property is charming but the walls are thin. Bring earplugs if you are a light sleeper.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'kavya.desai96@example.com'), 5, 'Noisy at night', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-AND';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'pooja.smith64@example.com'), 3, 'Lovely stay', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-BOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'aarav.rao59@example.com'), 4, 'Superb breakfast', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-BAY';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'sarah.tanaka69@example.com'), 1, 'Perfect for a short trip', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-POW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'nisha.mehta92@example.com'), 1, 'Would come back', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-CHE';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'isha.verma32@example.com'), 3, 'Great location', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-BAY';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'olivia.joshi90@example.com'), 1, 'Lovely stay', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-GOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'rohan.nair19@example.com'), 4, 'Perfect for a short trip', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-WOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'kavya.gupta72@example.com'), 1, 'Superb breakfast', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-MAL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'sanjay.kapoor51@example.com'), 1, 'Superb breakfast', 'The property is charming but the walls are thin. Bring earplugs if you are a light sleeper.'
     FROM properties p WHERE p.code = 'MUM-LOW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'ananya.smith64@example.com'), 4, 'Not as described', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-POW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'isha.gupta26@example.com'), 5, 'Lovely stay', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-BAY';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'nisha.mehta92@example.com'), 2, 'Lovely stay', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-CHE';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'kabir.chen62@example.com'), 3, 'Great location', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-CHE';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'isha.reddy42@example.com'), 1, 'Noisy at night', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-BAY';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'wei.gupta94@example.com'), 1, 'Great location', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-MAL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'pooja.kapoor63@example.com'), 2, 'Lovely stay', 'The property is charming but the walls are thin. Bring earplugs if you are a light sleeper.'
     FROM properties p WHERE p.code = 'MUM-BOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'james.chen5@example.com'), 2, 'Not as described', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-GOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'sarah.iyer78@example.com'), 5, 'Perfect for a short trip', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-BOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'nikhil.tanaka72@example.com'), 1, 'Perfect for a short trip', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-AND';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'nikhil.reddy93@example.com'), 5, 'Lovely stay', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-BOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'olivia.khan27@example.com'), 4, 'Good value', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-CSB';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'rahul.gupta38@example.com'), 5, 'Excellent service', 'The property is charming but the walls are thin. Bring earplugs if you are a light sleeper.'
     FROM properties p WHERE p.code = 'MUM-LOW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'hiroshi.rao28@example.com'), 2, 'Mixed feelings', 'The property is charming but the walls are thin. Bring earplugs if you are a light sleeper.'
     FROM properties p WHERE p.code = 'MUM-GOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'priya.iyer18@example.com'), 2, 'Noisy at night', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-CHE';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'sneha.iyer88@example.com'), 5, 'Would come back', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-AND';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'daniel.patel39@example.com'), 4, 'Not as described', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-WOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'olivia.tanaka16@example.com'), 3, 'Great location', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-JUH';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'hiroshi.johnson40@example.com'), 5, 'Perfect for a short trip', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'wei.gupta94@example.com'), 2, 'Perfect for a short trip', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-LOW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'divya.patel61@example.com'), 3, 'Good value', 'The property is charming but the walls are thin. Bring earplugs if you are a light sleeper.'
     FROM properties p WHERE p.code = 'MUM-BAY';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'aditya.sharma28@example.com'), 4, 'Good value', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-VER';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'daniel.nair64@example.com'), 3, 'Excellent service', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-BOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'rahul.smith11@example.com'), 1, 'Perfect for a short trip', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-AND';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'ananya.gupta81@example.com'), 4, 'Superb breakfast', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-DAD';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'sneha.iyer88@example.com'), 1, 'Noisy at night', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-LOW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'tara.verma48@example.com'), 1, 'Good value', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-GOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'hiroshi.gupta57@example.com'), 3, 'Perfect for a short trip', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-BAY';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'fatima.menon65@example.com'), 2, 'Mixed feelings', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-LOW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'hiroshi.tanaka21@example.com'), 3, 'Perfect for a short trip', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-AND';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'yuki.sharma49@example.com'), 4, 'Superb breakfast', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-JUH';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'priya.mehta98@example.com'), 5, 'Superb breakfast', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'rohan.chen37@example.com'), 5, 'Superb breakfast', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-DAD';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'yuki.chen79@example.com'), 5, 'Would come back', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-MAL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'nisha.gupta74@example.com'), 5, 'Excellent service', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-CHE';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'yuki.johnson8@example.com'), 4, 'Perfect for a short trip', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-JUH';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'rahul.smith11@example.com'), 5, 'Good value', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'hiroshi.tanaka21@example.com'), 2, 'Superb breakfast', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-CHE';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'kavya.desai96@example.com'), 2, 'Would come back', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-VER';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'divya.gupta71@example.com'), 4, 'Perfect for a short trip', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'tara.mehta17@example.com'), 4, 'Superb breakfast', 'The property is charming but the walls are thin. Bring earplugs if you are a light sleeper.'
     FROM properties p WHERE p.code = 'MUM-BOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'isha.gupta26@example.com'), 2, 'Not as described', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-JUH';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'karan.chen27@example.com'), 4, 'Great location', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-VER';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'sarah.reddy28@example.com'), 4, 'Excellent service', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-POW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'olivia.tanaka16@example.com'), 1, 'Perfect for a short trip', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-CHE';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'wei.menon80@example.com'), 3, 'Superb breakfast', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-DAD';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'james.chen5@example.com'), 5, 'Noisy at night', 'The property is charming but the walls are thin. Bring earplugs if you are a light sleeper.'
     FROM properties p WHERE p.code = 'MUM-VER';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'kavya.brown63@example.com'), 2, 'Excellent service', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-BOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'nikhil.nair52@example.com'), 4, 'Perfect for a short trip', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-JUH';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'pooja.bose58@example.com'), 5, 'Would come back', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-BAY';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'sneha.iyer88@example.com'), 5, 'Lovely stay', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-CHE';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'karan.smith49@example.com'), 2, 'Noisy at night', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-VER';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'james.gupta58@example.com'), 1, 'Not as described', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'lucas.patel2@example.com'), 3, 'Noisy at night', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-JUH';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'lucas.patel2@example.com'), 4, 'Lovely stay', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-BOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'rahul.gupta4@example.com'), 1, 'Would come back', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-BOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'nikhil.joshi54@example.com'), 4, 'Excellent service', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-JUH';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'olivia.kapoor46@example.com'), 5, 'Excellent service', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-MAL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'pooja.gupta70@example.com'), 4, 'Good value', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-BOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'ananya.brown53@example.com'), 3, 'Perfect for a short trip', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-MAL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'rahul.verma37@example.com'), 3, 'Mixed feelings', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-WOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'isha.smith4@example.com'), 1, 'Not as described', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-GOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'rohan.iyer3@example.com'), 2, 'Lovely stay', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-BOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'kabir.chen62@example.com'), 5, 'Would come back', 'The property is charming but the walls are thin. Bring earplugs if you are a light sleeper.'
     FROM properties p WHERE p.code = 'MUM-JUH';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'lucas.reddy43@example.com'), 1, 'Great location', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-JUH';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'sanjay.menon57@example.com'), 1, 'Perfect for a short trip', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-AND';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'fatima.menon65@example.com'), 3, 'Mixed feelings', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-POW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'pooja.smith64@example.com'), 4, 'Superb breakfast', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-CSB';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'nikhil.reddy17@example.com'), 3, 'Superb breakfast', 'The property is charming but the walls are thin. Bring earplugs if you are a light sleeper.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'pooja.bose94@example.com'), 3, 'Good value', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-AND';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'sarah.reddy28@example.com'), 5, 'Would come back', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-VER';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'james.chen5@example.com'), 2, 'Lovely stay', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-VER';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'rahul.verma37@example.com'), 2, 'Great location', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-DAD';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'pooja.gupta70@example.com'), 5, 'Would come back', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-LOW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'tara.nair14@example.com'), 3, 'Good value', 'The property is charming but the walls are thin. Bring earplugs if you are a light sleeper.'
     FROM properties p WHERE p.code = 'MUM-JUH';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'divya.smith34@example.com'), 3, 'Excellent service', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-BAY';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'emma.johnson17@example.com'), 3, 'Mixed feelings', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-CHE';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'kavya.desai96@example.com'), 2, 'Not as described', 'The property is charming but the walls are thin. Bring earplugs if you are a light sleeper.'
     FROM properties p WHERE p.code = 'MUM-VER';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'aarav.gupta29@example.com'), 5, 'Good value', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-VER';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'olivia.kapoor46@example.com'), 2, 'Perfect for a short trip', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-CHE';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'nikhil.nair64@example.com'), 3, 'Perfect for a short trip', 'The property is charming but the walls are thin. Bring earplugs if you are a light sleeper.'
     FROM properties p WHERE p.code = 'MUM-BOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'divya.patel91@example.com'), 3, 'Noisy at night', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-LOW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'olivia.khan27@example.com'), 1, 'Perfect for a short trip', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-GOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'nikhil.mehta58@example.com'), 2, 'Perfect for a short trip', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-DAD';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'karan.verma8@example.com'), 5, 'Excellent service', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-DAD';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'vikram.johnson72@example.com'), 3, 'Perfect for a short trip', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-WOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'meera.tanaka69@example.com'), 1, 'Would come back', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-BAY';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'priya.iyer18@example.com'), 5, 'Would come back', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-DAD';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'daniel.nair64@example.com'), 2, 'Lovely stay', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-JUH';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'lucas.joshi32@example.com'), 5, 'Noisy at night', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-DAD';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'aarav.verma79@example.com'), 2, 'Excellent service', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-DAD';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'nikhil.bose49@example.com'), 2, 'Perfect for a short trip', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-MAL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'emma.tanaka45@example.com'), 3, 'Mixed feelings', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'sneha.iyer88@example.com'), 5, 'Not as described', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-AND';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'lucas.johnson35@example.com'), 2, 'Not as described', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-WOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'nisha.chen26@example.com'), 3, 'Great location', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-JUH';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'hiroshi.reddy47@example.com'), 1, 'Not as described', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-LOW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'isha.joshi88@example.com'), 3, 'Mixed feelings', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-GOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'divya.reddy49@example.com'), 2, 'Perfect for a short trip', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'isha.patel77@example.com'), 2, 'Great location', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-WOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'olivia.khan64@example.com'), 4, 'Would come back', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-POW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'isha.joshi88@example.com'), 2, 'Superb breakfast', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-JUH';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'pooja.singh39@example.com'), 4, 'Superb breakfast', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-JUH';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'pooja.kapoor63@example.com'), 2, 'Great location', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-BAY';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'lucas.joshi32@example.com'), 5, 'Perfect for a short trip', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-LOW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'lucas.menon61@example.com'), 3, 'Great location', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-LOW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'lucas.joshi32@example.com'), 1, 'Noisy at night', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-POW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'ananya.smith64@example.com'), 2, 'Perfect for a short trip', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-BAY';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'rohan.smith69@example.com'), 5, 'Mixed feelings', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'tara.verma48@example.com'), 4, 'Superb breakfast', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-MAL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'isha.tanaka58@example.com'), 5, 'Not as described', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-LOW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'rahul.mehta18@example.com'), 2, 'Mixed feelings', 'The property is charming but the walls are thin. Bring earplugs if you are a light sleeper.'
     FROM properties p WHERE p.code = 'MUM-JUH';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'meera.bose53@example.com'), 1, 'Mixed feelings', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-LOW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'ananya.smith64@example.com'), 4, 'Good value', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-LOW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'olivia.sharma55@example.com'), 5, 'Lovely stay', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-CSB';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'nisha.bose44@example.com'), 3, 'Superb breakfast', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-VER';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'vikram.desai82@example.com'), 5, 'Excellent service', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-POW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'tara.singh74@example.com'), 1, 'Lovely stay', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-WOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'vikram.verma59@example.com'), 4, 'Noisy at night', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-MAL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'lucas.johnson35@example.com'), 2, 'Perfect for a short trip', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-WOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'nisha.chen26@example.com'), 5, 'Excellent service', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-LOW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'olivia.khan27@example.com'), 4, 'Lovely stay', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-VER';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'lucas.patel2@example.com'), 5, 'Noisy at night', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-CHE';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'rahul.smith11@example.com'), 1, 'Noisy at night', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-POW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'nikhil.joshi54@example.com'), 3, 'Superb breakfast', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-WOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'isha.sharma12@example.com'), 4, 'Noisy at night', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-AND';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'nisha.reddy32@example.com'), 2, 'Not as described', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-AND';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'rahul.gupta4@example.com'), 4, 'Mixed feelings', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-POW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'aarav.mehta65@example.com'), 1, 'Noisy at night', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-JUH';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'vikram.kapoor18@example.com'), 3, 'Superb breakfast', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-DAD';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'pooja.gupta98@example.com'), 5, 'Excellent service', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-BAY';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'vikram.kapoor10@example.com'), 2, 'Would come back', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-BOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'sarah.desai9@example.com'), 3, 'Superb breakfast', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'yuki.sharma49@example.com'), 1, 'Would come back', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-CSB';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'ananya.reddy65@example.com'), 1, 'Excellent service', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-BAY';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'vikram.desai82@example.com'), 4, 'Superb breakfast', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'rahul.verma37@example.com'), 5, 'Lovely stay', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'meera.tanaka69@example.com'), 2, 'Not as described', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-CHE';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'sanjay.singh64@example.com'), 1, 'Good value', 'The property is charming but the walls are thin. Bring earplugs if you are a light sleeper.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'daniel.joshi8@example.com'), 2, 'Would come back', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-DAD';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'vikram.singh69@example.com'), 5, 'Good value', 'The property is charming but the walls are thin. Bring earplugs if you are a light sleeper.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'ananya.patel93@example.com'), 3, 'Mixed feelings', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-GOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'wei.tanaka25@example.com'), 4, 'Noisy at night', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-AND';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'olivia.johnson39@example.com'), 3, 'Great location', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-MAL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'kavya.bose97@example.com'), 5, 'Mixed feelings', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-BAY';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'tara.khan29@example.com'), 2, 'Good value', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-WOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'divya.gupta71@example.com'), 1, 'Great location', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-JUH';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'rahul.sharma82@example.com'), 1, 'Superb breakfast', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-CSB';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'tara.smith74@example.com'), 3, 'Perfect for a short trip', 'The property is charming but the walls are thin. Bring earplugs if you are a light sleeper.'
     FROM properties p WHERE p.code = 'MUM-DAD';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'pooja.bose94@example.com'), 1, 'Superb breakfast', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-BAY';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'rahul.sharma82@example.com'), 1, 'Would come back', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-VER';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'rohan.iyer3@example.com'), 3, 'Lovely stay', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-WOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'meera.johnson55@example.com'), 1, 'Perfect for a short trip', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-AND';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'isha.joshi88@example.com'), 3, 'Perfect for a short trip', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'emma.reddy13@example.com'), 3, 'Lovely stay', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-MAL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'wei.chen21@example.com'), 2, 'Noisy at night', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-LOW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'tara.mehta17@example.com'), 4, 'Excellent service', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-DAD';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'nisha.reddy32@example.com'), 1, 'Noisy at night', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'meera.iyer68@example.com'), 5, 'Superb breakfast', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-BOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'wei.menon80@example.com'), 1, 'Mixed feelings', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-GOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'fatima.nair11@example.com'), 3, 'Mixed feelings', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-MAL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'olivia.khan27@example.com'), 3, 'Mixed feelings', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-LOW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'pooja.iyer60@example.com'), 2, 'Good value', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-POW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'divya.rao5@example.com'), 5, 'Would come back', 'The property is charming but the walls are thin. Bring earplugs if you are a light sleeper.'
     FROM properties p WHERE p.code = 'MUM-WOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'arjun.iyer6@example.com'), 2, 'Lovely stay', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-POW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'sanjay.kapoor51@example.com'), 1, 'Great location', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-JUH';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'olivia.brown66@example.com'), 1, 'Lovely stay', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-MAL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'karan.verma8@example.com'), 4, 'Excellent service', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-BOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'nikhil.johnson5@example.com'), 1, 'Would come back', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'rohan.smith69@example.com'), 4, 'Great location', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-BOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'sarah.desai9@example.com'), 5, 'Perfect for a short trip', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'daniel.nair64@example.com'), 1, 'Lovely stay', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-VER';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'isha.desai7@example.com'), 5, 'Mixed feelings', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-BAY';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'aditya.nair63@example.com'), 1, 'Lovely stay', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-POW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'vikram.johnson72@example.com'), 3, 'Perfect for a short trip', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-JUH';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'meera.singh18@example.com'), 5, 'Not as described', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-DAD';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'nikhil.nair52@example.com'), 2, 'Superb breakfast', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-VER';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'meera.mehta9@example.com'), 3, 'Perfect for a short trip', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-CSB';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'ananya.gupta47@example.com'), 2, 'Excellent service', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-JUH';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'lucas.joshi39@example.com'), 1, 'Would come back', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-AND';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'pooja.bose58@example.com'), 2, 'Great location', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-MAL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'james.chen5@example.com'), 5, 'Great location', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-CSB';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'isha.smith4@example.com'), 1, 'Not as described', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-BOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'vikram.khan26@example.com'), 2, 'Noisy at night', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-LOW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'meera.tanaka69@example.com'), 2, 'Not as described', 'The property is charming but the walls are thin. Bring earplugs if you are a light sleeper.'
     FROM properties p WHERE p.code = 'MUM-CSB';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'james.mehta57@example.com'), 3, 'Not as described', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-VER';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'emma.johnson64@example.com'), 4, 'Would come back', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-POW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'james.kapoor57@example.com'), 3, 'Would come back', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-CSB';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'aarav.verma79@example.com'), 1, 'Perfect for a short trip', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-AND';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'ananya.smith64@example.com'), 1, 'Not as described', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-BOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'wei.sharma49@example.com'), 5, 'Not as described', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-MAL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'olivia.khan64@example.com'), 3, 'Lovely stay', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-BOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'lucas.joshi32@example.com'), 2, 'Great location', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-MAL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'wei.singh90@example.com'), 4, 'Mixed feelings', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-GOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'rahul.smith11@example.com'), 2, 'Mixed feelings', 'The property is charming but the walls are thin. Bring earplugs if you are a light sleeper.'
     FROM properties p WHERE p.code = 'MUM-BAY';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'pooja.iyer60@example.com'), 1, 'Perfect for a short trip', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-AND';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'divya.rao5@example.com'), 3, 'Not as described', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-POW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'kavya.gupta72@example.com'), 1, 'Great location', 'The property is charming but the walls are thin. Bring earplugs if you are a light sleeper.'
     FROM properties p WHERE p.code = 'MUM-LOW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'isha.desai7@example.com'), 2, 'Lovely stay', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-JUH';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'lucas.verma94@example.com'), 3, 'Lovely stay', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-DAD';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'yuki.johnson8@example.com'), 3, 'Mixed feelings', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-JUH';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'karan.verma8@example.com'), 1, 'Perfect for a short trip', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-BAY';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'james.chen5@example.com'), 1, 'Would come back', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-MAL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'karan.desai63@example.com'), 1, 'Not as described', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-BOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'pooja.singh39@example.com'), 5, 'Excellent service', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'aarav.verma79@example.com'), 2, 'Not as described', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-WOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'rahul.chen16@example.com'), 3, 'Lovely stay', 'The property is charming but the walls are thin. Bring earplugs if you are a light sleeper.'
     FROM properties p WHERE p.code = 'MUM-BAY';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'divya.bose14@example.com'), 3, 'Superb breakfast', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-BOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'wei.tanaka25@example.com'), 3, 'Great location', 'The property is charming but the walls are thin. Bring earplugs if you are a light sleeper.'
     FROM properties p WHERE p.code = 'MUM-LOW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'emma.reddy13@example.com'), 2, 'Good value', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-GOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'yuki.menon34@example.com'), 2, 'Noisy at night', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-BAY';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'lucas.brown44@example.com'), 5, 'Great location', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-CHE';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'arjun.brown67@example.com'), 5, 'Good value', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'aditya.sharma28@example.com'), 4, 'Not as described', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-BAY';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'sarah.desai9@example.com'), 4, 'Great location', 'The property is charming but the walls are thin. Bring earplugs if you are a light sleeper.'
     FROM properties p WHERE p.code = 'MUM-POW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'ananya.menon37@example.com'), 3, 'Superb breakfast', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-AND';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'nikhil.kapoor67@example.com'), 5, 'Not as described', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-BOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'fatima.gupta83@example.com'), 3, 'Good value', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-VER';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'nikhil.nair52@example.com'), 1, 'Lovely stay', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'fatima.patel10@example.com'), 1, 'Excellent service', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-DAD';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'kavya.gupta51@example.com'), 3, 'Good value', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'sarah.iyer78@example.com'), 3, 'Good value', 'The property is charming but the walls are thin. Bring earplugs if you are a light sleeper.'
     FROM properties p WHERE p.code = 'MUM-DAD';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'divya.gupta71@example.com'), 3, 'Superb breakfast', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-LOW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'karan.desai63@example.com'), 4, 'Great location', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-AND';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'aarav.mehta65@example.com'), 1, 'Noisy at night', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-BOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'lucas.brown44@example.com'), 3, 'Great location', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-MAL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'kavya.brown63@example.com'), 4, 'Not as described', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-GOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'emma.patel61@example.com'), 4, 'Great location', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-LOW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'divya.reddy49@example.com'), 4, 'Perfect for a short trip', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'sanjay.kapoor51@example.com'), 5, 'Perfect for a short trip', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-BAY';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'yuki.chen79@example.com'), 3, 'Superb breakfast', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-CHE';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'kabir.chen62@example.com'), 3, 'Not as described', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-GOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'isha.verma32@example.com'), 4, 'Not as described', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-AND';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'yuki.johnson8@example.com'), 2, 'Perfect for a short trip', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-CSB';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'aditya.sharma28@example.com'), 1, 'Perfect for a short trip', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-JUH';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'ananya.gupta81@example.com'), 1, 'Superb breakfast', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-LOW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'olivia.brown88@example.com'), 3, 'Not as described', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-DAD';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'pooja.bose58@example.com'), 3, 'Good value', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-WOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'meera.iyer68@example.com'), 5, 'Superb breakfast', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-MAL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'aditya.nair63@example.com'), 1, 'Perfect for a short trip', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-POW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'sarah.iyer78@example.com'), 4, 'Good value', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-CHE';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'hiroshi.sharma98@example.com'), 2, 'Noisy at night', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-CHE';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'olivia.kapoor46@example.com'), 1, 'Good value', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-MAL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'sneha.iyer88@example.com'), 2, 'Superb breakfast', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'nisha.bose20@example.com'), 2, 'Excellent service', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-CHE';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'karan.kapoor42@example.com'), 1, 'Good value', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-BAY';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'meera.joshi3@example.com'), 3, 'Superb breakfast', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'isha.joshi88@example.com'), 4, 'Mixed feelings', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-WOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'hiroshi.reddy47@example.com'), 4, 'Great location', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'ananya.reddy65@example.com'), 4, 'Great location', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-VER';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'aarav.gupta29@example.com'), 4, 'Noisy at night', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-BOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'karan.desai63@example.com'), 5, 'Mixed feelings', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-POW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'vikram.sharma22@example.com'), 3, 'Noisy at night', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-GOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'ananya.gupta11@example.com'), 2, 'Lovely stay', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-GOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'wei.tanaka25@example.com'), 5, 'Superb breakfast', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-CHE';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'nikhil.bose49@example.com'), 2, 'Noisy at night', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-CHE';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'meera.johnson55@example.com'), 1, 'Lovely stay', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-BAY';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'daniel.patel39@example.com'), 3, 'Lovely stay', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-BOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'ananya.smith64@example.com'), 5, 'Superb breakfast', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-CHE';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'lucas.joshi32@example.com'), 4, 'Superb breakfast', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-GOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'emma.patel61@example.com'), 2, 'Noisy at night', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-AND';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'olivia.johnson39@example.com'), 1, 'Would come back', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-CHE';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'divya.bose14@example.com'), 3, 'Noisy at night', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-POW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'sarah.reddy28@example.com'), 4, 'Great location', 'We booked a deluxe room and were upgraded on arrival. Genuinely thoughtful service throughout.'
     FROM properties p WHERE p.code = 'MUM-DAD';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'kavya.singh18@example.com'), 2, 'Excellent service', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-LOW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'isha.reddy42@example.com'), 1, 'Lovely stay', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-WOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'fatima.gupta83@example.com'), 1, 'Noisy at night', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-VER';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'sanjay.brown15@example.com'), 4, 'Lovely stay', 'Check-in took twenty minutes longer than it should have, but the room itself was excellent.'
     FROM properties p WHERE p.code = 'MUM-CSB';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'aditya.sharma28@example.com'), 1, 'Good value', 'Not quite what the photos suggested, though the bed was extremely comfortable.'
     FROM properties p WHERE p.code = 'MUM-DAD';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'kavya.gupta72@example.com'), 5, 'Noisy at night', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-GOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'kavya.gupta51@example.com'), 4, 'Noisy at night', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-VER';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'vikram.kapoor10@example.com'), 3, 'Noisy at night', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-JUH';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'isha.reddy42@example.com'), 3, 'Mixed feelings', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-BOR';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'wei.iyer8@example.com'), 4, 'Good value', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-MUL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'vikram.brown9@example.com'), 1, 'Excellent service', 'The room was spotless and the staff could not have been more helpful. Breakfast was a highlight.'
     FROM properties p WHERE p.code = 'MUM-MAL';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'kavya.verma44@example.com'), 4, 'Noisy at night', 'Great location, easy walk to the sea face. The air conditioning was a little loud at night.'
     FROM properties p WHERE p.code = 'MUM-LOW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'kabir.chen62@example.com'), 2, 'Mixed feelings', 'The property is charming but the walls are thin. Bring earplugs if you are a light sleeper.'
     FROM properties p WHERE p.code = 'MUM-POW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'olivia.kapoor46@example.com'), 2, 'Superb breakfast', 'Housekeeping missed our room one day. A quick word at reception and it was sorted within the hour.'
     FROM properties p WHERE p.code = 'MUM-POW';
INSERT INTO reviews (property_id, guest_id, rating, title, body)
     SELECT p.id, (SELECT id FROM guests WHERE lower(email) = 'yuki.bose10@example.com'), 4, 'Would come back', 'Good value for Mumbai. The rooftop is worth the visit on its own.'
     FROM properties p WHERE p.code = 'MUM-LOW';
