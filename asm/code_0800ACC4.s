	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800ACC4
sub_0800ACC4: @ 0x0800ACC4
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r5, r2, #0
	adds r5, #0x38
	ldrb r1, [r5]
	lsls r0, r1, #5
	adds r7, r2, #0
	adds r7, #0x37
	ldrb r1, [r7]
	adds r0, r1, r0
	lsls r0, r0, #1
	ldr r1, _0800AD14 @ =0x02022C60
	adds r0, r0, r1
	adds r6, r2, #0
	adds r6, #0x39
	ldrb r1, [r6]
	adds r4, r2, #0
	adds r4, #0x3a
	ldrb r2, [r4]
	movs r3, #0
	bl TmFillRect_thm
	ldrb r5, [r5]
	lsls r0, r5, #5
	ldrb r7, [r7]
	adds r0, r7, r0
	lsls r0, r0, #1
	ldr r1, _0800AD18 @ =0x02023460
	adds r0, r0, r1
	ldrb r1, [r6]
	ldrb r2, [r4]
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #3
	bl EnableBgSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800AD14: .4byte 0x02022C60
_0800AD18: .4byte 0x02023460
