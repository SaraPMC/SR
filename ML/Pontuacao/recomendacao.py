avaliacoesUsers = {'SARA PINHEIRO': 
		{'CDB XPTO': 2.5, 
		 'LCA EFGH': 3.5,
		 'LCI ABCD': 3.0},
        
	  'IGOR JOHANES': 
		{'FII': 3.0, 
		 'EFI123': 3.5, 
		 'FII3': 1.5},

	  'HENRIQUE OLIVEIRA': 
	    {'MGLU3': 2.5, 
		 'VIIA3': 3.0,
        'CPLE6': 4.0},
			 
	  'JOÃO SILVA': 
		{'CDB XPTO': 3.5, 
		 'LCI ABCD': 3.0,
           },
                   
				 
	  'CRISTINA SOUZA': 
		{'EFI123': 3.0,
         },
                   
				                    
	  'RICHARD MOTA':
		{'LCA EFGH': 3.0,
		'FII': 4.0},  
           
				                    
	  'PAULO HENRIQUE':
		{'LCA EFGH':3.0,
		'VIIA3':8.0,
		'FII3':6.0}
                   
       

}
        

avaliacoesModel = {'Model':{'CDB XPTO', 
		 'LCA EFGH',
		 'LCI ABCD',
		 'FII',
         'EFI123', 
		 'MGLU3',
         'VIIA3'}
 }
  
avaliacoesInvest = {'CDB XPTO': 
		{'SARA PINHEIRO': 2.5, 
		 'JOÃO SILVA:': 3.0 },
	 
	   'LCA EFGH': 
		{'SARA PINHEIRO': 3.5
		  },
				 
	 'LCI ABCD': 
		{'SARA PINHEIRO': 3.0, 
		 'JOÃO SILVA:': 1.5 },
	
	 'FII': 
		{'IGOR JOHANES': 3.5
		 },
				 
	 'EFI123': 
		{'IGOR JOHANES': 2.5, 
		 'CRISTINA SOUZA:': 3.0},
				 
	 'FII3': 
		{'IGOR JOHANES': 3.0},
	 'MGLU3': 
		{'HENRIQUE OLIVEIRA': 3.0},
	 'CPLE6': 
		{'HENRIQUE OLIVEIRA': 3.0}
                    
}
        
##Fazer uma função de inserção de usuário
##Fazer um sistema que pergunta se o usuário existe 
##Excluir um usuário do sistema 
        
from math import sqrt

def knn(base,user1,user2):
    si = {}
    for item in base[user1]:
        if item in base[user2]: 
            si[item] = 1
        
    if len(si)==0: 
        return 0
        
    soma = sum([pow(base[user1][item] - base[user2][item], 2)
             for item in base[user1] if item in base[user2]])
    return 1/(1+sqrt(soma))

def getSim(base,user):
    sim = [(knn(base,user, users), users) 
                for users in base if users != user]
    sim.sort()
    sim.reverse()
    return sim [0:20]

def getRecomUser(base, user):
    totais = {}
    somaSim = {}
    for users in base:
        if users == user: continue
        sim = knn(base,user,users)

        if sim <= 0: continue
        
        for item in base[users]:
            if item not in base[user]:
                totais.setdefault (item, 0)
                totais[item]+= base[users][item]*sim
                somaSim.setdefault(item, 0)
                somaSim[item]+= sim
                
    rankings=[(total/somaSim[item], item) for item, total in totais.items()]
    rankings.sort()
    rankings.reverse()
    return rankings[0:20]   

def loadInvestimentos(path='C:/ml-100k'):
    Investimentos = {}
    for linha in open(path + '/u.item'):
        (id, titulo) = linha.split('|')[0:2]
        Investimentos[id] = titulo
    
    base = {}
    for linha in open(path + '/u.data'):
        (user, idInvestimentos,nota,tempo) = linha.split('\t')
        base.setdefault(user,{})
        base[user][Investimentos[idInvestimentos]] = float(nota)
    return base

def calItensSim(base):
    result = {}
    for item in base:
        notas = getSim(base, item)
        result[item] = notas
    return result

def getRecomItens(baseUser, simItens, user):
    notasUser = baseUser[user]
    notas={}
    totalSim={}
    #for(item , nota) in notasUser.item():
    for (item,nota) in notasUser.items():
        for(sim , item2) in simItens[item]:
            if item2 in notasUser: continue
            notas.setdefault(item2, 0)
            notas[item2] += sim * nota
            totalSim.setdefault(item2, 0)
            totalSim[item2] += sim
    rankings=[(score/totalSim[item],item) for item, score in notas.items()]
    rankings.sort()
    rankings.reverse()
    return rankings