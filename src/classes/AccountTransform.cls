/**
 * @autor - david
 */
public class AccountTransform {

    public String toCpfFormated(String cpf){
        cpf = toCpfUnformated(cpf);
        String format = '{0}.{1}.{2}-{3}';
        List<Object> parameters = new List<Object> {cpf.substring(0,3),cpf.substring(3,6),cpf.substring(6,9),cpf.substring(9,11) };
        return String.format(format, parameters);

    }

    public String toCnpjFormated(String cnpj){
        cnpj = toCnpjUnformated(cnpj);
        String format = '{0}.{1}.{2}/{3}-{4}';
        List<Object> parameters = new List<Object> {cnpj.substring(0,2),cnpj.substring(2,5),
                                                    cnpj.substring(5,8),cnpj.substring(8,12),
                                                    cnpj.substring(12,14) };
        return String.format(format, parameters);
    }

    public String toCepFormated(String cep){
        cep = toCepUnformated(cep);
        String format = '{0}-{1}';
        List<Object> parameters = new List<Object> {cep.substring(0,5),cep.substring(5,8)};
        return String.format(format, parameters);
    }

    public String toCpfUnformated(String cpf){
        String unformatedCpf = "";
        unformatedCpf = StringDoCpf.substring(0,3) + "." + StringDoCpf.substring(3,6) + "." + StringDoCpf.substring(6,9) + "-" + "StringDoCpf.substring(9,11);
        return unformatedCpf;
    }

    public String toCnpjUnformated(String cnpj){
        String unformatedCnpj = cnpj.replace('.', '');
        unformatedCnpj = unformatedCnpj.replace('-', '');
        unformatedCnpj = unformatedCnpj.replace('/', '');
        return unformatedCnpj;
    }

    public String toCepUnformated(String cep){
        return cep.replace('-', '');
    }

}
