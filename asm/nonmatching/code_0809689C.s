	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809689C
sub_0809689C: @ 0x0809689C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl InitIcons
	ldr r0, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x35
	ldrb r1, [r5]
	movs r2, #1
	bl SomethingPrepListRelated
	ldr r0, _0809692C @ =0x02012BA0
	ldr r1, _08096930 @ =0x02023C7E
	ldrb r3, [r5]
	lsls r2, r3, #1
	adds r6, r4, #0
	adds r6, #0x4c
	adds r2, r6, r2
	ldrh r2, [r2]
	lsrs r2, r2, #4
	ldr r3, [r4, #0x2c]
	bl sub_08095CA8
	ldr r0, _08096934 @ =0x02022EA4
	ldr r1, [r4, #0x2c]
	bl DrawPrepScreenItemIcons
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r7, r4, #0
	adds r7, #0x3a
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r6, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
	movs r0, #5
	bl EnableBgSync
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _08096948
	ldr r0, _08096938 @ =0x02012466
	ldrh r0, [r0]
	cmp r0, #0
	beq _08096940
	ldr r2, _0809693C @ =0x020117E4
	ldrb r5, [r5]
	lsls r3, r5, #1
	adds r0, r7, r3
	ldrh r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldrh r2, [r0, #2]
	lsls r1, r1, #4
	adds r3, r6, r3
	ldrh r0, [r3]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	b _08096946
	.align 2, 0
_0809692C: .4byte 0x02012BA0
_08096930: .4byte 0x02023C7E
_08096934: .4byte 0x02022EA4
_08096938: .4byte 0x02012466
_0809693C: .4byte 0x020117E4
_08096940:
	bl CloseHelpBox
	movs r0, #0xff
_08096946:
	strh r0, [r4, #0x38]
_08096948:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
