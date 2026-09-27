	.include "macro.inc"

	.syntax unified

	thumb_func_start SetCRSpellBgPosition
SetCRSpellBgPosition: @ 0x0806404C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08064068
	ldr r0, _08064064 @ =0x081D8599
	ldrh r1, [r4, #2]
	ldrb r0, [r0]
	subs r0, r1, r0
	b _08064070
	.align 2, 0
_08064064: .4byte 0x081D8599
_08064068:
	ldr r0, _080640A0 @ =0x081D859E
	ldrb r0, [r0]
	ldrh r3, [r4, #2]
	subs r0, r0, r3
_08064070:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r2, #0x58
	ldrh r4, [r4, #4]
	subs r2, r2, r4
	ldrh r0, [r5, #0x12]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r3, [r5, #2]
	subs r1, r1, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldrh r5, [r5, #4]
	subs r2, r2, r5
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080640A0: .4byte 0x081D859E
