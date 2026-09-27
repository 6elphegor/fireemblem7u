	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804168C
sub_0804168C: @ 0x0804168C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	bl ReadGameSave
	ldr r1, _080416CC @ =0x0202BBF8
	movs r0, #0xdf
	ldrb r2, [r1, #0x14]
	ands r0, r2
	strb r0, [r1, #0x14]
	adds r1, #0x41
	movs r0, #0xd
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	ldr r1, _080416D0 @ =0x0203D90C
	ldr r0, [r4, #0x48]
	strb r0, [r1, #4]
	bl ApplyUnitSpritePalettes
	bl sub_08044ED8
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080416CC: .4byte 0x0202BBF8
_080416D0: .4byte 0x0203D90C
