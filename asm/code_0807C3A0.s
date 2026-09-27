	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807C3A0
sub_0807C3A0: @ 0x0807C3A0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	adds r4, r0, #0
	adds r4, #0x64
	ldrh r0, [r4]
	adds r0, #8
	strh r0, [r4]
	movs r0, #1
	movs r1, #0
	bl GetScanlineBuf
	adds r5, r0, #0
	movs r0, #0
	bl GetBgYOffset
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0
	ldrsh r1, [r4, r2]
	str r0, [sp]
	movs r0, #0x50
	mov r8, r0
	str r0, [sp, #4]
	movs r6, #1
	str r6, [sp, #8]
	adds r0, r5, #0
	movs r2, #2
	movs r3, #2
	bl ScanlineRotation
	movs r0, #1
	movs r1, #0xa0
	bl GetScanlineBuf
	adds r5, r0, #0
	movs r0, #0
	bl GetBgXOffset
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0
	ldrsh r1, [r4, r2]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	str r6, [sp, #8]
	adds r0, r5, #0
	movs r2, #3
	movs r3, #2
	bl ScanlineRotation
	bl SwapScanlineBufs
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
