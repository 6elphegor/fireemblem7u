	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080732AC
sub_080732AC: @ 0x080732AC
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x85
	bl PlaySeSpacial
	ldr r0, _080732E0 @ =0x083F83B4
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldr r3, _080732E4 @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080732E0: .4byte 0x083F83B4
_080732E4: .4byte 0x000041C0
