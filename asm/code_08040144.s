	.include "macro.inc"

	.syntax unified

	thumb_func_start SioPostBattle_Loop_Main
SioPostBattle_Loop_Main: @ 0x08040144
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x40
	ldrb r6, [r0]
	ldr r2, [r4, #0x64]
	subs r2, #1
	str r2, [r4, #0x64]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	bl sub_080490D4
	adds r5, r4, #0
	adds r5, #0x41
	ldrb r0, [r5]
	cmp r0, #0
	beq _080401CE
	ldr r2, [r4, #0x64]
	asrs r2, r2, #3
	ldr r3, _080401E4 @ =0x081D532A
	ldrb r0, [r5]
	subs r0, #1
	lsls r0, r0, #1
	lsls r1, r6, #3
	adds r0, r0, r1
	adds r0, r0, r3
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, #4
	cmp r2, r0
	bne _080401CE
	adds r0, r4, #0
	bl sub_0803FE24
	movs r0, #4
	bl EnableBgSync
	ldr r2, _080401E8 @ =0x0203DC9C
	ldrb r1, [r5]
	subs r1, #1
	lsls r0, r1, #3
	adds r0, r4, r0
	adds r0, #0x44
	ldrb r3, [r0]
	lsls r0, r3, #1
	adds r2, #0x24
	adds r0, r0, r2
	ldrh r2, [r0]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	adds r0, r4, #0
	movs r1, #0x28
	bl StartDrawLinkArenaRankSprites
	ldrb r2, [r5]
	subs r2, #1
	lsls r2, r2, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r1, r1, r2
	str r0, [r1]
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
_080401CE:
	ldr r0, [r4, #0x64]
	cmp r0, #0
	bne _080401DA
	adds r0, r4, #0
	bl Proc_Break
_080401DA:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080401E4: .4byte 0x081D532A
_080401E8: .4byte 0x0203DC9C
