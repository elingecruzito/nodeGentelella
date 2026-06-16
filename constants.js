// vendor/constants.js  ← reemplaza el archivo original con este

module.exports = {
    // Lee credenciales desde variables de entorno; si no existen, usa valores por defecto
    mysql_host:     process.env.MYSQL_HOST     || '127.0.0.1',
    mysql_user:     process.env.MYSQL_USER     || 'root',
    mysql_password: process.env.MYSQL_PASSWORD || '',
    mysql_database: process.env.MYSQL_DATABASE || 'gantelella',

    row_colum_name:    "COLUMN_NAME",
    row_null:          "IS_NULLABLE",
    row_data_type:     "DATA_TYPE",
    row_comumn_key:    "COLUMN_KEY",
    row_extra:         "EXTRA",
    row_column_coment: "COLUMN_COMMENT",

    option_null_no:  "NO",
    option_null_yes: "YES",

    option_key_primary: "PRI",
    option_key_mul:     "MUL",

    type_integer:   "int",
    type_varchar:   "varchar",
    type_text:      "text",
    type_timestamp: "timestamp",
    type_time:      "time",
    type_date:      "date",

    path_models:      "./models/",
    path_controllers: "./routes/",
    path_views:       "./views/",
};
