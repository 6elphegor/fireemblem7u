	.include "macro.inc"

	.syntax unified

	thumb_func_start WfxSnowStorm_VSync
WfxSnowStorm_VSync: @ 0x0802D82C
	push {r4, r5, r6, r7, lr}
	bl GetOamSplice
	cmp r0, #0
	beq _0802D88C
	bl GetGameTime
	movs r1, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #7
	ldr r0, _0802D894 @ =0x020027DC
	adds r4, r1, r0
	ldr r7, _0802D898 @ =0x0202BBB8
	movs r6, #0xff
	movs r5, #0x1f
_0802D84E:
	ldrh r1, [r4]
	ldrh r2, [r4, #4]
	adds r0, r1, r2
	strh r0, [r4]
	ldrh r3, [r4, #2]
	ldrh r2, [r4, #6]
	adds r1, r3, r2
	strh r1, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	movs r3, #0xc
	ldrsh r2, [r7, r3]
	subs r0, r0, r2
	ands r0, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	movs r3, #0xe
	ldrsh r2, [r7, r3]
	subs r1, r1, r2
	ands r1, r6
	ldrb r2, [r4, #8]
	lsls r3, r2, #2
	ldr r2, _0802D89C @ =0x00001018
	adds r3, r3, r2
	ldr r2, _0802D8A0 @ =0x08B905C0
	bl PutOamLoRam
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _0802D84E
_0802D88C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D894: .4byte 0x020027DC
_0802D898: .4byte 0x0202BBB8
_0802D89C: .4byte 0x00001018
_0802D8A0: .4byte 0x08B905C0
