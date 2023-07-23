package config

type ConfigStruct struct {
	Dev      bool     `mapstructure:"dev"`
	Server   server   `mapstructure:"server"`
	Database database `mapstructure:"database"`
}

type server struct {
	GRPCPort     int      `mapstructure:"grpc_port"`
	RESTfulPort  int      `mapstructure:"restful_port"`
	AllowOrigins []string `mapstructure:"allow_origins"`
	LogFilePath  string   `mapstructure:"log_file_path"`
	Secret       string   `mapstructure:"secret"`
	Domain       string   `mapstructure:"domain"`
}

type database struct {
	DBName   string `mapstructure:"db_name"`
	Host     string `mapstructure:"host"`
	Port     string `mapstructure:"port"`
	Username string `mapstructure:"username"`
	Password string `mapstructure:"password"`
}
