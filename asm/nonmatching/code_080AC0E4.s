	.include "macro.inc"

	.syntax unified

	thumb_func_start SoundRoomUi_Loop_ShufflePlayUiSlideIn
SoundRoomUi_Loop_ShufflePlayUiSlideIn: @ 0x080AC0E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	adds r6, r7, #0
	adds r6, #0x3a
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	movs r1, #8
	subs r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	muls r1, r0, r1
	cmp r1, #0
	bge _080AC106
	adds r1, #0x3f
_080AC106:
	asrs r1, r1, #6
	movs r0, #0x18
	subs r0, r0, r1
	adds r5, r7, #0
	adds r5, #0x3b
	strb r0, [r5]
	ldrb r0, [r5]
	movs r1, #3
	bl __udivsi3
	movs r1, #0x14
	subs r1, r1, r0
	adds r4, r7, #0
	adds r4, #0x3c
	strb r1, [r4]
	ldr r0, _080AC16C @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _080AC170 @ =0x08CE5480
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
	ldrb r5, [r5]
	cmp r5, #0x18
	bne _080AC164
	movs r0, #0
	strb r0, [r6]
	adds r0, r7, #0
	bl Proc_Break
_080AC164:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AC16C: .4byte 0x02023460
_080AC170: .4byte 0x08CE5480
