-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07-Dez-2021 às 23:51
-- Versão do servidor: 10.4.18-MariaDB
-- versão do PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projetobarbearia`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aula`
--

CREATE TABLE `aula` (
  `idAula` int(11) NOT NULL,
  `materia` varchar(45) COLLATE utf8_bin NOT NULL,
  `dataInicio` date NOT NULL,
  `dataFim` date NOT NULL,
  `horario` time NOT NULL,
  `qtdAula` int(11) NOT NULL,
  `idCurso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `barbeiro`
--

CREATE TABLE `barbeiro` (
  `idBarbeiro` int(11) NOT NULL,
  `nome` varchar(200) COLLATE utf8_bin NOT NULL,
  `dataNasc` date NOT NULL,
  `cpf` varchar(14) COLLATE utf8_bin NOT NULL,
  `email` varchar(90) COLLATE utf8_bin NOT NULL,
  `endereco` varchar(256) COLLATE utf8_bin NOT NULL,
  `telefone` varchar(15) COLLATE utf8_bin NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `barbeiro`
--

INSERT INTO `barbeiro` (`idBarbeiro`, `nome`, `dataNasc`, `cpf`, `email`, `endereco`, `telefone`, `idUsuario`) VALUES
(9, 'Daniel Tenorio', '1994-03-15', '326.028.102-90', 'daniel.tenorio@gmail.com', 'Riacho Fundo II', '(61) 98765-4321', 6),
(10, 'Wesley Vitoriano', '1992-09-08', '381.057.983-10', 'wesley.vitoriano@gmail.com', 'Riacho Fundo I', '(61) 99898-7677', 7),
(11, 'Marcos Lima', '1991-08-21', '443.381.312-50', 'marcos.lima@gmail.com', 'Samambaia', '(61) 99181-9358', 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nome` varchar(200) COLLATE utf8_bin NOT NULL,
  `dataNasc` date NOT NULL,
  `cpf` varchar(14) COLLATE utf8_bin NOT NULL,
  `email` varchar(90) COLLATE utf8_bin NOT NULL,
  `endereco` varchar(256) COLLATE utf8_bin NOT NULL,
  `telefone` varchar(15) COLLATE utf8_bin NOT NULL,
  `idTurma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nome`, `dataNasc`, `cpf`, `email`, `endereco`, `telefone`, `idTurma`) VALUES
(20, 'Adriano de Paula', '1989-06-01', '711.174.578-77', 'adrian.de.paula@gmail.com', 'Taguatinga Norte', '(61) 92453-4789', 8),
(22, 'Barbaba Marques', '1996-04-04', '018.417.711-12', 'barbara.marques@gmail.com', 'Guará I', '(61) 98597-7544', 9),
(23, 'Igor Souza', '2002-08-27', '432.918.918-64', 'igor.souza@gmail.com', 'Núcleo Bandeirante', '(61) 99357-3579', 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE `curso` (
  `idCurso` int(11) NOT NULL,
  `nome` varchar(200) COLLATE utf8_bin NOT NULL,
  `cargaHoraria` int(11) NOT NULL,
  `preco` double NOT NULL,
  `descricao` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `nomeArquivo` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `caminho` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `curso`
--

INSERT INTO `curso` (`idCurso`, `nome`, `cargaHoraria`, `preco`, `descricao`, `nomeArquivo`, `caminho`) VALUES
(1, 'Curso Avançado', 2200, 1400, 'Curso ministrado pelo barbeiro e fundador Daniel Tenorio no momento conta apenas com o curso “Barber Trying” com duração de 4 meses.', 'image1-corte.jpg', 'C:\\Users\\Acer Aspire\\Documents\\ETB 4ºA\\Desenv. de Projeto\\Barbearia Tenório\\ProjetoBarbeariaV2\\web\\imagens\\image1-corte.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu`
--

CREATE TABLE `menu` (
  `idMenu` int(11) NOT NULL,
  `nome` varchar(200) COLLATE utf8_bin NOT NULL,
  `link` varchar(256) COLLATE utf8_bin NOT NULL,
  `icone` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `exibir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `menu`
--

INSERT INTO `menu` (`idMenu`, `nome`, `link`, `icone`, `exibir`) VALUES
(1, 'Home', 'index.jsp', '', 1),
(2, 'Perfis', 'listarPerfil.jsp', '', 1),
(3, 'Menus', 'listarMenu.jsp', NULL, 1),
(4, 'Cadastrar Menus', 'cadastrarMenu.jsp', NULL, 0),
(5, 'Usuários', 'listarUsuario.jsp', '', 1),
(6, 'Gerenciar Menus', 'gerenciarMenu?acao=gerenciar', '', 2),
(7, 'Cadastrar Menu Perfil', 'cadastrarMenuPerfil.jsp', '', 2),
(8, 'Cadastrar Perfil', 'cadastrarPerfil.jsp', '', 2),
(9, 'Alterar Perfil', 'gerenciarPerfil?acao=alterar', '', 2),
(10, 'Deletar Perfil', 'gerenciarPerfil?acao=deletar', '', 2),
(11, 'Alterar Menu', 'gerenciarMenu?acao=alterar', '', 2),
(12, 'Deletar Menu', 'gerenciarMenu?acao=deletar', '', 2),
(17, 'Clientes', 'listarCliente.jsp', '', 1),
(18, 'Cadastar Cliente', 'cadastrarCliente.jsp', '', 2),
(19, 'Alterar Cliente', 'gerenciarCliente?acao=alterar', '', 2),
(20, 'Deletar Cliente', 'gerenciarCliente?acao=deletar', '', 2),
(25, 'Acessos', 'gerenciarMenuPerfil?acao=gerenciar', '', 2),
(26, 'Barbeiros', 'listarBarbeiro.jsp', '', 1),
(27, 'Cadastrar Barbeiro', 'cadastrarBarbeiro.jsp', '', 2),
(28, 'Alterar Barbeiro', 'gerenciarBarbeiro?acao=alterar', '', 2),
(29, 'Deletar Barbeiro', 'gerenciarBarbeiro?acao=deletar', '', 2),
(30, 'Cursos', 'listarCurso.jsp', '', 1),
(31, 'Cadastrar Curso', 'cadastrarCurso.jsp', '', 2),
(32, 'Alterar Curso', 'gerenciarCurso?acao=alterar', '', 2),
(33, 'Deletar Curso', 'gerenciarCurso?acao=deletar', '', 2),
(34, 'Turmas', 'listarTurma.jsp', '', 1),
(35, 'Cadastrar Turma', 'cadastrarTurma.jsp', '', 2),
(36, 'Alterar Turma', 'gerenciarTurma?acao=alterar', '', 2),
(37, 'Deletar Turma', 'gerenciarTurma?acao=deletar', '', 2),
(38, 'Vendas', 'listarVenda.jsp', '', 1),
(42, 'Aulas', 'listarAula.jsp', '', 1),
(43, 'Cadastrar Aula', 'cadastrarAula.jsp', '', 2),
(44, 'Alterar Aula', 'gerenciarAula?acao=alterar', '', 2),
(45, 'Deletar Aula', 'gerenciarAula?acao=deletar', '', 2),
(46, 'Realizar Venda', 'formVenda.jsp?acao=novo', '', 2),
(47, 'Continuar Venda', 'formVenda.jsp?acao=c', '', 2),
(48, 'Finalizar Venda', 'formFinalizarVenda.jsp', '', 2),
(49, 'Venda por Data', 'formVendaPorData.jsp', '', 2),
(50, 'Listar Data Venda', 'gerenciarVenda?acao=listarData', '', 2),
(51, 'Cadastrar Usuário', 'cadastrarUsuario.jsp', '', 2),
(52, 'Alterar Usuário', 'gerenciarUsuario?acao=alterar', '', 2),
(53, 'Desativar Usuário', 'gerenciarUsuario?acao=desativar', '', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu_perfil`
--

CREATE TABLE `menu_perfil` (
  `idMenu` int(11) NOT NULL,
  `idPerfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `menu_perfil`
--

INSERT INTO `menu_perfil` (`idMenu`, `idPerfil`) VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 1),
(2, 3),
(3, 1),
(3, 3),
(4, 1),
(5, 1),
(5, 3),
(6, 1),
(7, 1),
(8, 1),
(8, 3),
(9, 1),
(10, 1),
(11, 1),
(11, 3),
(12, 1),
(12, 3),
(17, 1),
(17, 3),
(18, 1),
(18, 3),
(19, 1),
(19, 3),
(20, 1),
(20, 3),
(25, 1),
(26, 1),
(26, 3),
(27, 1),
(27, 3),
(28, 1),
(29, 1),
(30, 1),
(30, 3),
(30, 4),
(31, 1),
(31, 3),
(32, 1),
(32, 3),
(33, 1),
(33, 3),
(34, 1),
(34, 3),
(34, 4),
(35, 1),
(35, 3),
(36, 1),
(36, 3),
(37, 1),
(37, 3),
(38, 1),
(38, 3),
(42, 1),
(42, 3),
(42, 4),
(43, 1),
(43, 3),
(44, 1),
(44, 3),
(45, 1),
(45, 3),
(46, 1),
(46, 3),
(47, 1),
(47, 3),
(48, 1),
(48, 3),
(49, 1),
(49, 3),
(50, 1),
(50, 3),
(51, 1),
(51, 3),
(52, 1),
(52, 3),
(53, 1),
(53, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE `perfil` (
  `idPerfil` int(11) NOT NULL,
  `nome` varchar(200) COLLATE utf8_bin NOT NULL,
  `dataCadastro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`idPerfil`, `nome`, `dataCadastro`) VALUES
(1, 'Administrador', '2021-10-13'),
(3, 'Funcionário', '2021-10-13'),
(4, 'Cliente', '2021-10-13');

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `idTurma` int(11) NOT NULL,
  `nome` varchar(200) COLLATE utf8_bin NOT NULL,
  `qtdAluno` int(11) NOT NULL,
  `ano` varchar(20) COLLATE utf8_bin NOT NULL,
  `semestre` varchar(45) COLLATE utf8_bin NOT NULL,
  `turno` varchar(50) COLLATE utf8_bin NOT NULL,
  `idBarbeiro` int(11) NOT NULL,
  `idCurso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `turma`
--

INSERT INTO `turma` (`idTurma`, `nome`, `qtdAluno`, `ano`, `semestre`, `turno`, `idBarbeiro`, `idCurso`) VALUES
(8, 'Turma I', 10, '2022', '1º ', 'Vespertino', 9, 1),
(9, 'Turma II', 14, '2022', '2º', 'Vespertino', 9, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nome` varchar(200) COLLATE utf8_bin NOT NULL,
  `login` varchar(45) COLLATE utf8_bin NOT NULL,
  `senha` varchar(45) COLLATE utf8_bin NOT NULL,
  `status` int(11) NOT NULL,
  `idPerfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nome`, `login`, `senha`, `status`, `idPerfil`) VALUES
(1, 'Rodrigo H.', 'rodrigo', '12345', 1, 1),
(2, 'João V.', 'joao', '12345', 1, 1),
(3, 'Manoel J.', 'manoel', '12345', 1, 1),
(4, 'Livia G.', 'livia', '12345', 1, 1),
(6, 'Daniel T.', 'daniel', '12345', 1, 3),
(7, 'Wesley V.', 'wesley', '12345', 1, 3),
(8, 'Marcos L.', 'marcos', '12345', 1, 3),
(9, 'Ramiro F.', 'ramiro', '12345', 1, 1),
(10, 'Luane S.', 'luane', '12345', 1, 1),
(11, 'Adriano P.', 'adriano', '12345', 1, 4),
(12, 'Barbara M.', 'barbara', '12345', 1, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `idVenda` int(11) NOT NULL,
  `dataVenda` date NOT NULL,
  `precoTotal` double NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`idVenda`, `dataVenda`, `precoTotal`, `idCliente`, `idUsuario`) VALUES
(1, '2021-11-01', 1400, 20, 6),
(2, '2021-11-03', 1400, 20, 6),
(3, '2021-11-05', 2800, 20, 6),
(4, '2021-11-07', 1400, 20, 7),
(5, '2021-11-09', 4200, 20, 6),
(6, '2021-12-12', 1400, 22, 7),
(7, '2021-12-14', 1400, 22, 7),
(8, '2021-12-16', 2800, 22, 8),
(9, '2021-12-18', 1400, 22, 8),
(10, '2021-12-20', 4200, 22, 6),
(11, '2022-01-23', 2800, 20, 7),
(12, '2022-01-25', 1400, 20, 8),
(13, '2022-01-27', 1400, 20, 6),
(14, '2022-01-29', 2800, 22, 6),
(15, '2022-01-31', 4200, 20, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda_curso`
--

CREATE TABLE `venda_curso` (
  `idVenda` int(11) NOT NULL,
  `idCurso` int(11) NOT NULL,
  `qtd` int(11) NOT NULL,
  `precoVendido` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `venda_curso`
--

INSERT INTO `venda_curso` (`idVenda`, `idCurso`, `qtd`, `precoVendido`) VALUES
(1, 1, 2, 250),
(2, 1, 2, 250),
(3, 1, 4, 250);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `aula`
--
ALTER TABLE `aula`
  ADD PRIMARY KEY (`idAula`),
  ADD KEY `fk_aula_curso1_idx` (`idCurso`);

--
-- Índices para tabela `barbeiro`
--
ALTER TABLE `barbeiro`
  ADD PRIMARY KEY (`idBarbeiro`),
  ADD KEY `fk_barbeiro_usuario1_idx` (`idUsuario`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `fk_cliente_turma1_idx` (`idTurma`);

--
-- Índices para tabela `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`idCurso`);

--
-- Índices para tabela `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`idMenu`);

--
-- Índices para tabela `menu_perfil`
--
ALTER TABLE `menu_perfil`
  ADD PRIMARY KEY (`idMenu`,`idPerfil`),
  ADD KEY `fk_menu_has_perfil_perfil1_idx` (`idPerfil`),
  ADD KEY `fk_menu_has_perfil_menu_idx` (`idMenu`);

--
-- Índices para tabela `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`idPerfil`);

--
-- Índices para tabela `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`idTurma`),
  ADD KEY `fk_turma_barbeiro1_idx` (`idBarbeiro`),
  ADD KEY `fk_turma_curso1_idx` (`idCurso`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `fk_usuario_perfil1_idx` (`idPerfil`);

--
-- Índices para tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`idVenda`),
  ADD KEY `fk_Venda_usuario1_idx` (`idUsuario`),
  ADD KEY `fk_Venda_cliente1_idx` (`idCliente`);

--
-- Índices para tabela `venda_curso`
--
ALTER TABLE `venda_curso`
  ADD PRIMARY KEY (`idVenda`,`idCurso`),
  ADD KEY `fk_curso_has_venda_venda1_idx` (`idVenda`),
  ADD KEY `fk_curso_has_venda_curso1_idx` (`idCurso`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aula`
--
ALTER TABLE `aula`
  MODIFY `idAula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `barbeiro`
--
ALTER TABLE `barbeiro`
  MODIFY `idBarbeiro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `curso`
--
ALTER TABLE `curso`
  MODIFY `idCurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `menu`
--
ALTER TABLE `menu`
  MODIFY `idMenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de tabela `perfil`
--
ALTER TABLE `perfil`
  MODIFY `idPerfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `turma`
--
ALTER TABLE `turma`
  MODIFY `idTurma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `idVenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aula`
--
ALTER TABLE `aula`
  ADD CONSTRAINT `fk_aula_curso1` FOREIGN KEY (`idCurso`) REFERENCES `curso` (`idCurso`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `barbeiro`
--
ALTER TABLE `barbeiro`
  ADD CONSTRAINT `fk_barbeiro_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_turma1` FOREIGN KEY (`idTurma`) REFERENCES `turma` (`idTurma`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `menu_perfil`
--
ALTER TABLE `menu_perfil`
  ADD CONSTRAINT `fk_menu_has_perfil_menu` FOREIGN KEY (`idMenu`) REFERENCES `menu` (`idMenu`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_menu_has_perfil_perfil1` FOREIGN KEY (`idPerfil`) REFERENCES `perfil` (`idPerfil`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `fk_turma_barbeiro1` FOREIGN KEY (`idBarbeiro`) REFERENCES `barbeiro` (`idBarbeiro`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_turma_curso1` FOREIGN KEY (`idCurso`) REFERENCES `curso` (`idCurso`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_perfil1` FOREIGN KEY (`idPerfil`) REFERENCES `perfil` (`idPerfil`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `fk_Venda_cliente1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Venda_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `venda_curso`
--
ALTER TABLE `venda_curso`
  ADD CONSTRAINT `fk_curso_has_venda_curso1` FOREIGN KEY (`idCurso`) REFERENCES `curso` (`idCurso`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_curso_has_venda_venda1` FOREIGN KEY (`idVenda`) REFERENCES `venda` (`idVenda`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
