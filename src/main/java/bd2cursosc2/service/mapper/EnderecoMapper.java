package bd2cursosc2.service.mapper;

import bd2cursosc2.domain.Endereco;
import bd2cursosc2.domain.Usuario;
import bd2cursosc2.service.dto.EnderecoDTO;
import bd2cursosc2.service.dto.UsuarioDTO;
import org.mapstruct.*;

/**
 * Mapper for the entity {@link Endereco} and its DTO {@link EnderecoDTO}.
 */
@Mapper(componentModel = "spring")
public interface EnderecoMapper extends EntityMapper<EnderecoDTO, Endereco> {
    @Mapping(target = "usuario", source = "usuario", qualifiedByName = "usuarioId")
    EnderecoDTO toDto(Endereco s);

    @Named("usuarioId")
    @BeanMapping(ignoreByDefault = true)
    @Mapping(target = "id", source = "id")
    UsuarioDTO toDtoUsuarioId(Usuario usuario);
}
