	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08061F08
sub_08061F08: @ 0x08061F08
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08061F48 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061F4C @ =0x08BA4094
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _08061F50 @ =0x081E9576
	str r1, [r0, #0x48]
	ldr r1, _08061F54 @ =0x08BA40D4
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08061F58 @ =0x08BA40AC
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	ldr r0, _08061F5C @ =0x082C5C08
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061F48: .4byte 0x0201774C
_08061F4C: .4byte 0x08BA4094
_08061F50: .4byte 0x081E9576
_08061F54: .4byte 0x08BA40D4
_08061F58: .4byte 0x08BA40AC
_08061F5C: .4byte 0x082C5C08
