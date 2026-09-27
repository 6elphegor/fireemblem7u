	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804FE78
sub_0804FE78: @ 0x0804FE78
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r5, _0804FEF4 @ =0x0201B784
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _0804FEBC
	ldr r1, [r4, #0x4c]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r5, #0
	bl LZ77UnCompWram
	ldr r1, _0804FEF8 @ =0x02024460
	movs r0, #6
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
	movs r0, #8
	bl EnableBgSync
_0804FEBC:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #2
	bne _0804FEEA
	ldr r0, _0804FEF8 @ =0x02024460
	ldr r1, _0804FEFC @ =0x0000601F
	bl TmFill
	movs r0, #8
	bl EnableBgSync
	ldr r0, _0804FF00 @ =0x02022860
	movs r1, #6
	movs r2, #0xa
	movs r3, #0x10
	bl EfxPalBlackInOut
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
_0804FEEA:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804FEF4: .4byte 0x0201B784
_0804FEF8: .4byte 0x02024460
_0804FEFC: .4byte 0x0000601F
_0804FF00: .4byte 0x02022860
