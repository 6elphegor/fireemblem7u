	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08061D24
sub_08061D24: @ 0x08061D24
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08061D60 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061D64 @ =0x08BA3F3C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	movs r1, #7
	str r1, [r0, #0x44]
	strh r2, [r0, #0x2e]
	movs r1, #5
	str r1, [r0, #0x48]
	ldr r0, _08061D68 @ =0x082D9800
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r0, _08061D6C @ =0x082D9C74
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061D60: .4byte 0x0201774C
_08061D64: .4byte 0x08BA3F3C
_08061D68: .4byte 0x082D9800
_08061D6C: .4byte 0x082D9C74
