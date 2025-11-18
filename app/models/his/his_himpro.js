"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.HisHimproModel = void 0;
const maxLimit = 250;
const hcode = process.env.HOSPCODE;
let hisHospcode = process.env.HOSPCODE;
class HisHimproModel {
    check() {
        return true;
    }
    async testConnect(db) {
        const row = await db('hospital').first();
        return { connection: row ? true : false };
    }
    getDepartment(db, depCode = '', depName = '') {
        return [];
    }
    getWard(db, wardCode = '', wardName = '') {
        let sql = db('getward');
        if (wardCode) {
            sql.where('ward', wardCode);
        }
        else if (wardName) {
            sql.whereLike('name', `%${wardName}%`);
        }
        return sql
            .select('*')
            .orderBy('wardcode')
            .limit(maxLimit);
    }
    getDr(db, code, license_no) {
        return [];
    }
    async getPerson1(db, columnName, searchText) {
        return [];
    }
    getReferOut(db, date, hospCode = hisHospcode, visitNo = null) {
        return db('refer')
            .select('*')
            .where("date_serve", searchText)
            .limit(maxLimit);
    }
    sumReferOut(db, dateStart, dateEnd) {
        return db('referinout')
            .select('*')
            .whereBetween('referin.refer_date', [dateStart, dateEnd])
            .limit(maxLimit);
    }
    getPerson(db, columnName, searchText, hospCode = hisHospcode) {
        columnName = columnName === 'hn_code' ? 'pid' : columnName;
        columnName = columnName === 'cid' ? 'idcard' : columnName;
        return db('person')
            .select(db.raw('"' + hcode + '" as hospcode'))
            .select('person.hn as PID, person.hn as HN, person.CID as CID, person.title_code as PRENAME, person.lname as NAME, person.fname as FNAME, person.lname as LNAME, person.birthdate as BIRTH, person.sex_code as SEX, person.marry_status as MSTATUS, person.occupation as OCCUPATION_OLD, "" as FATHER, "" as MOTHER, "" as EDUCATION, person.nationality as NATION, "" as RACE, person.religion as RELIGION, "" as ABOGROUP, "" as RHGROUP, person.Tel as TELEPHONE, person.Tel as MOBILE, "" as MOVEIN, "" as DISCHARGE, person.last_update as D_UPDATE')
            .where(columnName, "=", searchText)
            .limit(lowmaxLimit);
    }
    getAddress(db, columnName, searchNo, hospCode = hisHospcode) {
        return [];
    }
    getService(db, columnName, searchText, hospCode = hisHospcode) {
        columnName = columnName === 'visitNo' ? 'visit.visitno' : columnName;
        columnName = columnName === 'hn' ? 'visit.pid' : columnName;
        columnName = columnName === 'cid' ? 'person.idcard' : columnName;
        columnName = columnName === 'date_serv' ? 'visit.visitdate' : columnName;
        return db('visit')
            .leftJoin('person', 'visit.pid', 'person.pid')
            .leftJoin('cright', 'visit.rightcode', 'cright.rightcode')
            .select('visit.pcucode as HOSPCODE', 'visit.pid as PID', 'visit.pid as HN', 'person.idcard as CID', 'visit.visitno as SEQ', 'visit.visitdate as DATE_SERV', 'visit.rightcode', 'cright.mapright as INSTYPE', 'visit.rightno as INSID', 'visit.hosmain as MAIN', 'visit.hosmain as HMAIN', 'visit.hossub as SUB', 'visit.hossub as HSUB', 'visit.symptoms as CHIEFCOMP', 'visit.vitalcheck as PRESENTILLNESS', 'visit.symptomsco as PASTHISTORY', 'visit.healthsuggest1 as PHYSICALEXAM', 'visit.weight as WEIGHT', 'visit.height as HEIGHT', 'visit.weight as temperature', 'visit.pulse as PR', 'visit.respri as RR', 'visit.waist as WAIST', 'visit.money1 as PRICE', 'visit.receivefromhos as REFERINHOSP', 'visit.refertohos as REFEROUTHOSP')
            .select(db.raw(`REPLACE(visit.timestart, ':', '') as TIME_SERV`))
            .select(db.raw(`case when isnull(visit.refertohos) then '' when visit.refer='06' then '3' else '1' end as CAUSEOUT`))
            .select(db.raw(`case when isnull(visit.receivefromhos) then '1' else '3' end as TYPEIN`))
            .select(db.raw(`case when LOCATE('/', visit.pressure)>0 then substr(visit.pressure,1,LOCATE('/', visit.pressure)-1) else '' end as SBP`))
            .select(db.raw(`case when LOCATE('/', visit.pressure)>0 then substr(visit.pressure,LOCATE('/', visit.pressure)+1) else '' end as DBP`))
            .select(db.raw(`'1' as LOCATION`))
            .select(db.raw(`'1' as SERVPLACE`))
            .select(db.raw(`concat(visit.visitdate,' ', visit.timestart) as D_UPDATE`))
            .where(columnName, searchText)
            .orderBy('visit.visitdate', 'desc')
            .limit(maxLimit);
    }
    getDiagnosisOpd(db, visitno, hospCode = hisHospcode) {
        return db('visitdiag as dx')
            .leftJoin('visit', 'dx.visitno', 'visit.visitno')
            .leftJoin('person', 'visit.pid', 'person.pid')
            .select('dx.pcucode as HOSPCODE', 'dx.visitno as SEQ', 'visit.pid as PID', 'person.idcard as CID', 'dx.clinic as CLINIC', 'dx.dxtype as DIAGTYPE', 'dx.doctordiag as PROVIDER', 'visit.visitdate as DATE_SERV', 'dx.dateupdate as D_UPDATE')
            .select(db.raw(`REPLACE(dx.diagcode, '.', '') as DIAGCODE`))
            .select(db.raw(' "IT" as codeset'))
            .where('dx.visitno', visitno)
            .orderBy('dx.dxtype')
            .limit(maxLimit);
    }
    getDiagnosisOpdAccident(db, dateStart, dateEnd, hospCode = hisHospcode) {
        return [];
    }
    async getDiagnosisOpdVWXY(db, date) {
        return [];
    }
    async getDiagnosisSepsisOpd(db, dateStart, dateEnd) {
        return [];
    }
    async getDiagnosisSepsisIpd(db, dateStart, dateEnd) {
        return [];
    }
    getProcedureOpd(db, visitno, hospCode = hisHospcode) {
        return [];
    }
    getChargeOpd(db, visitNo, hospCode = hisHospcode) {
        return [];
    }
    getLabRequest(db, columnName, searchNo, hospCode = hisHospcode) {
        return [];
    }
    getLabResult(db, columnName, searchNo, referID = '', hospCode = hisHospcode) {
        return [];
    }
    getInvestigation(db, columnName, searchNo, hospCode = hisHospcode) {
        return [];
    }
    getDrugOpd(db, visitNo, hospCode = hisHospcode) {
        return db('visitdrug as drug')
            .leftJoin('visit', 'drug.visitno', 'visit.visitno')
            .leftJoin('person', 'visit.pid', 'person.pid')
            .leftJoin('cdrug', 'drug.drugcode', 'cdrug.drugcode')
            .leftJoin('cdrugunitsell', 'cdrug.unitsell', 'cdrugunitsell.unitsellcode')
            .select('drug.pcucode as HOSPCODE', 'drug.visitno as SEQ', 'visit.pid as PID', 'person.idcard as CID', 'visit.visitdate as DATE_SERV', 'drug.clinic as CLINIC', 'drug.drugcode', 'drug.unit as AMOUNT', 'cdrug.unitsell as UNIT', 'cdrugunitsell.unitsellname as UNIT_PACKING', 'cdrug.drugname as DNAME', 'drug.realprice as DRUGPRICE', 'drug.costprice as DRUGCOST', 'drug.dose as drug_usage', 'cdrug.drugproperties as caution', 'cdrug.drugcode24 as DIDSTD', 'cdrug.drugcode24 as DID', 'cdrug.tmtcode as DID_TMT', 'drug.doctor1 as PROVIDER', 'drug.dateupdate as D_UPDATE')
            .where('drug.visitno', visitNo)
            .where('cdrug.drugtype', '01')
            .limit(maxLimit);
    }
    getAdmission(db, columnName, searchValue, hospCode = hisHospcode) {
        return [];
    }
    getDiagnosisIpd(db, columnName, searchNo, hospCode = hisHospcode) {
        return [];
    }
    getDiagnosisIpdAccident(db, dateStart, dateEnd, hospCode = hisHospcode) {
        return [];
    }
    getProcedureIpd(db, an, hospCode = hisHospcode) {
        return [];
    }
    getChargeIpd(db, an, hospCode = hisHospcode) {
        return [];
    }
    async getDrugIpd(db, an, hospCode = hisHospcode) {
        return [];
    }
    getAccident(db, visitNo, hospCode = hisHospcode) {
        return [];
    }
    getDrugAllergy(db, hn, hospCode = hisHospcode) {
        return db('personalergic as drugallg')
            .leftJoin('cdrug', 'drugallg.drugcode', 'cdrug.drugcode')
            .leftJoin('cdrugallergysymtom as sym', 'drugallg.symptom', 'sym.symtomcode')
            .leftJoin('person', 'drugallg.pid', 'person.pid')
            .select('person.pcucodeperson as HOSPCODE', 'person.pcucodeperson as INFORMHOSP', 'drugallg.pid as PID', 'person.idcard as CID', 'cdrug.drugcode24 as DRUGALLERGY', 'cdrug.drugcode as DCODE', 'cdrug.drugname as DNAME', 'drugallg.levelalergic as ALEVE', 'drugallg.symptom as SYMPTOM', 'sym.symtomname as DETAIL', 'drugallg.typedx as TYPEDX', 'drugallg.informant as INFORMANT', 'cdrug.drugcode24 as DID', 'cdrug.tmtcode as DID_TMT', 'drugallg.daterecord as DATERECORD', 'drugallg.dateupdate as D_UPDATE')
            .where('drugallg.pid', hn)
            .whereRaw('(drugallg.informhosp is null or drugallg.pcucodeperson=drugallg.informhosp)');
    }
    getAppointment(db, visitNo, hospCode = hisHospcode) {
        return [];
    }
    async getReferHistory(db, columnName, searchNo, hospCode = hisHospcode) {
        return [];
    }
    getClinicalRefer(db, referNo, hospCode = hisHospcode) {
        return [];
    }
    getInvestigationRefer(db, referNo, hospCode = hisHospcode) {
        return [];
    }
    getCareRefer(db, referNo, hospCode = hisHospcode) {
        return [];
    }
    getReferResult(db, visitDate, hospCode = hisHospcode) {
        return [];
    }
    getProviderDr(db, drList) {
        return [];
    }
    getProvider(db, columnName, searchNo, hospCode = hisHospcode) {
        return [];
    }
    getData(db, tableName, columnName, searchNo, hospCode = hisHospcode) {
        return db(tableName)
            .select(db.raw('"' + hcode + '" as hospcode'))
            .select('*')
            .where(columnName, "=", searchNo)
            .limit(maxLimit);
    }
    countBedNo(db) {
        return db('countBedNo').first();
    }
    async getBedNo(db, bedno = null, start = -1, limit = 1000) {
        return db('bedno').select('*')
    }
    sumReferIn(db, dateStart, dateEnd) {
        return db('referin')
            .select('*')
            .whereBetween('referin.refer_date', [dateStart, dateEnd])
            .limit(maxLimit);
    }
    concurrentIPDByWard(db, date) {
        const queryDate = date || new Date().toISOString().split('T')[0];
        return db('concurrentipdbyward')
            .select('*')
            .limit(maxLimit);
    }
    concurrentIPDByClinic(db, date) {
        const queryDate = date || new Date().toISOString().split('T')[0];
        return db('concurrentipdbyclinic')
            .select('*')
            .limit(maxLimit);
    }
    sumOpdVisitByClinic(db, date) {
        const d = date || new Date().toISOString().slice(0, 10);
        return db('sumopdvisitbyclinic')
            .select('*')
            .limit(maxLimit);
    }
    
    async getVisitForMophAlert(db, date, isRowCount = false, start = -1, limit = 1000) {
   

    const baseSql = db('getvisitformophalert')
        .where('date_service', date);

    if (isRowCount) {
        return baseSql.clone().count('* as row_count').first();
    }

    let sql = baseSql.clone()
        .select(
            'hospcode',
            'cid',
            'hn',
            'vn',
            'department_type',
            'department_code',
            'department_name',
            'date_service',
            'time_service'
        )
        .orderBy(['date_service', 'time_service']);

    if (start >= 0) {
        sql = sql.offset(start).limit(limit);
    }

    const rows = await sql;
    // ถ้า view ไม่มีคอลัมน์ status ก็ไม่ต้อง filter เพิ่ม
    return rows;
}
}
exports.HisHimproModel = HisHimproModel;
