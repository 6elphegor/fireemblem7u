	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08055468
sub_08055468: @ 0x08055468
	push {lr}
	sub sp, #0x10
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bhi _080554B0
	lsls r0, r0, #2
	ldr r1, _08055484 @ =_08055488
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08055484: .4byte _08055488
_08055488: @ jump table
	.4byte _0805549C @ case 0
	.4byte _080554A6 @ case 1
	.4byte _080554B0 @ case 2
	.4byte _080554B0 @ case 3
	.4byte _0805549C @ case 4
_0805549C:
	movs r2, #0x30
	cmp r3, #0
	bne _080554B8
	movs r2, #0x21
	b _080554B8
_080554A6:
	movs r2, #0x30
	cmp r3, #0
	bne _080554B8
	movs r2, #0x1d
	b _080554B8
_080554B0:
	movs r2, #0x30
	cmp r3, #0
	bne _080554B8
	movs r2, #3
_080554B8:
	ldr r0, _080554DC @ =0x081D85AE
	movs r1, #1
	rsbs r1, r1, #0
	lsls r2, r2, #1
	ldr r3, _080554E0 @ =0x0201CF78
	adds r2, r2, r3
	movs r3, #0xf
	str r3, [sp]
	movs r3, #5
	str r3, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	movs r3, #0x42
	bl EfxTmCpyExt
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_080554DC: .4byte 0x081D85AE
_080554E0: .4byte 0x0201CF78
