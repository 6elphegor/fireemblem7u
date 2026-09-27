	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806DE44
sub_0806DE44: @ 0x0806DE44
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _0806DE84 @ =0x08C9CE58
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r2, #0xa8
	lsls r2, r2, #2
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, _0806DE88 @ =0x08C9D0D4
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_Start
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DE84: .4byte 0x08C9CE58
_0806DE88: .4byte 0x08C9D0D4
