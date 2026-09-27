	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08044F3C
sub_08044F3C: @ 0x08044F3C
	push {lr}
	bl sub_08044ED8
	bl sub_08044D14
	bl sub_08044D2C
	ldr r0, _08044F6C @ =0x0202E3EC
	ldr r2, [r0]
	movs r1, #0
	ldr r0, _08044F70 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _08044F5A
	movs r1, #1
_08044F5A:
	adds r0, r2, #0
	bl BmMapFillg
	bl sub_08044DCC
	bl RenderMap
	pop {r0}
	bx r0
	.align 2, 0
_08044F6C: .4byte 0x0202E3EC
_08044F70: .4byte 0x0202BBF8
