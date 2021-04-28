install.packages('gsheet')
library(gsheet)

# Ada sebuah data seluruh sekolah di suatu daerah silahkan data sekolah tersebut 
# dalam beberapa bagian(POINT 60) :

data <- gsheet2tbl('https://docs.google.com/spreadsheets/d/196Cru9L75tFSwAXqjHSphsLeJKkYtrE7x1yiwPglTRE/edit#gid=545639812')

#1
install.packages("sqldf")
library(sqldf)
data_1 <- sqldf("select npsn, nama_sp, alamat_jalan, desa_kelurahan, kec_, prov_, jenjang, status_sekolah from data")

#2
data_2 <- sqldf("select * from data_1 where jenjang = 'SMP'")

#3
data_3 <- sqldf("select npsn, nama_sp, pd_agama_budha, prov_ from data where pd_agama_budha > 0")

#4
data_4 <- sqldf("select * from data_1 where status_sekolah = 'Swasta' and kec_ LIKE 'Kec. %Serpong'")
nrow(data_4)

#5
data_5 <- sqldf("select * from data where daya_listrik < 2200 and wilayah_adat_terpencil = 'Ya'
                and status_sekolah = 'Negeri' and waktu_penyelenggaraan = 'Pagi'")
nrow(data_5)

#6
data_6 <- sqldf("select * from data where jenjang = 'SMK' and sk_izin_operasional = '-'")
nrow(data_6)

# ========================================= #

# Data sekolah di indonesia di bagi jadi beberapa bagian (POINT 40)

data_7 <- gsheet2tbl('https://drive.google.com/file/d/0B9keDA5sgXk0MVdZSnliWmRpSE9weHhvWkJ5SVZaSFFGWkdB/view')
data_7

#1
data7_jenjang <- sqldf('select DISTINCT jenjang from data_7')

data_7_sd <- sqldf("select * from data_7 where jenjang = 'SD'")
data_7_smp <- sqldf("select * from data_7 where jenjang = 'SMP'")
data_7_sma <- sqldf("select * from data_7 where jenjang = 'SMA'")
data_7_slb <- sqldf("select * from data_7 where jenjang = 'SLB'")
data_7_smk <- sqldf("select * from data_7 where jenjang = 'SMK'")
data_7_smtk <- sqldf("select * from data_7 where jenjang = 'SMTK'")
data_7_smlb <- sqldf("select * from data_7 where jenjang = 'SMLB'")
data_7_smplb <- sqldf("select * from data_7 where jenjang = 'SMPLB'")
data_7_sdlb <- sqldf("select * from data_7 where jenjang = 'SDLB'")
data_7_sdtk <- sqldf("select * from data_7 where jenjang = 'SDTK'")
data_7_satap <- sqldf("select * from data_7 where jenjang LIKE 'Satap SD SMP SMA'")
data_7_smptk <- sqldf("select * from data_7 where jenjang = 'SMPTK'")

#2
nrow(data_7_sd)
nrow(data_7_smp)
nrow(data_7_sma)
nrow(data_7_slb)
nrow(data_7_smk)
nrow(data_7_smtk)
nrow(data_7_smlb)
nrow(data_7_smplb)
nrow(data_7_sdlb)
nrow(data_7_sdtk)
nrow(data_7_satap)
nrow(data_7_smptk)

#3
data7_status_sekolah <- sqldf('select DISTINCT status_sekolah from data_7')



