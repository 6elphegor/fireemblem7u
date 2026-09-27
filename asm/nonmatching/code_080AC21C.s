	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AC21C
sub_080AC21C: @ 0x080AC21C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r2, r6, #0
	adds r2, #0x3a
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	movs r1, #8
	subs r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	muls r0, r1, r0
	cmp r0, #0
	bge _080AC23E
	adds r0, #0x3f
_080AC23E:
	asrs r0, r0, #6
	adds r5, r6, #0
	adds r5, #0x3b
	strb r0, [r5]
	ldrb r0, [r5]
	movs r1, #3
	bl __udivsi3
	movs r1, #0x14
	subs r1, r1, r0
	adds r4, r6, #0
	adds r4, #0x3c
	strb r1, [r4]
	ldr r0, _080AC2A4 @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _080AC2A8 @ =0x08CE5480
	ldr r0, [r0]
	movs r1, #2
	str r1, [sp]
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r1, #1
	str r1, [sp, #4]
	movs r1, #0x1a
	str r1, [sp, #8]
	movs r1, #7
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #0x19
	movs r3, #1
	bl sub_080A8838
	movs r0, #2
	bl EnableBgSync
	ldrb r1, [r5]
	cmp r1, #0
	bne _080AC29A
	adds r0, r6, #0
	adds r0, #0x30
	strb r1, [r0]
	adds r0, r6, #0
	bl Proc_Break
_080AC29A:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AC2A4: .4byte 0x02023460
_080AC2A8: .4byte 0x08CE5480
