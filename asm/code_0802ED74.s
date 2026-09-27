	.include "macro.inc"

	.syntax unified

	thumb_func_start ArenaGenerateBaseWeapons
ArenaGenerateBaseWeapons: @ 0x0802ED74
	push {r4, lr}
	sub sp, #8
	ldr r1, _0802EDBC @ =0x081C403C
	mov r0, sp
	movs r2, #8
	bl memcpy
	ldr r4, _0802EDC0 @ =0x0203A7F4
	ldrb r0, [r4, #0xd]
	add r0, sp
	ldrb r0, [r0]
	bl MakeNewItem
	strh r0, [r4, #0x1a]
	ldrb r0, [r4, #0xe]
	add r0, sp
	ldrb r0, [r0]
	bl MakeNewItem
	strh r0, [r4, #0x1c]
	movs r0, #1
	strb r0, [r4, #0xc]
	ldrb r0, [r4, #0xd]
	cmp r0, #3
	bne _0802EDAA
	movs r0, #2
	strb r0, [r4, #0xc]
_0802EDAA:
	ldrb r0, [r4, #0xe]
	cmp r0, #3
	bne _0802EDB4
	movs r0, #2
	strb r0, [r4, #0xc]
_0802EDB4:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802EDBC: .4byte 0x081C403C
_0802EDC0: .4byte 0x0203A7F4
