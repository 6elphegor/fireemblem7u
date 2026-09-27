	.include "macro.inc"

	.syntax unified

	thumb_func_start ResetPrepMenuScreen
ResetPrepMenuScreen: @ 0x080900DC
	push {r4, r5, lr}
	ldr r0, _0809013C @ =0x08CC416C
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _08090134
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	lsls r0, r0, #5
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08090140 @ =0x02022C60
	adds r0, r0, r1
	adds r5, r4, #0
	adds r5, #0x2b
	ldrb r1, [r5]
	lsls r2, r1, #1
	adds r2, #2
	movs r1, #9
	movs r3, #0
	bl TmFillRect_thm
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	lsls r0, r0, #5
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08090144 @ =0x02023460
	adds r0, r0, r1
	ldrb r5, [r5]
	lsls r2, r5, #1
	adds r2, #2
	movs r1, #9
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #3
	bl EnableBgSync
_08090134:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809013C: .4byte 0x08CC416C
_08090140: .4byte 0x02022C60
_08090144: .4byte 0x02023460
