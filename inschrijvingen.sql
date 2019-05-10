INSERT INTO opleidingen('opleiding_code')
VALUES(opleiding_code VARCHAR(32) NOT NUll);

#of
    CREATE TABLE `opleidingen` (
	`opleiding_code` VARCHAR(3) NOT NULL,
	`titel` VARCHAR(30) NOT NULL,
    PRIMARY KEY (`opleiding_code`)
);
#want applicatie en mediaontwikkeling bevat 32 characters, waarvoorheen 10 en dat zal zorgen voor data truncated