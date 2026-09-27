	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08046464
sub_08046464: @ 0x08046464
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	bl StartMu
	ldr r1, _080464A0 @ =0x03001420
	lsls r4, r4, #2
	adds r4, r4, r1
	str r0, [r4]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	str r0, [r6]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	mov r1, r8
	str r0, [r1]
	ldr r0, [r5, #0xc]
	ldr r1, _080464A4 @ =0xFFFFFDFF
	ands r0, r1
	str r0, [r5, #0xc]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080464A0: .4byte 0x03001420
_080464A4: .4byte 0xFFFFFDFF
