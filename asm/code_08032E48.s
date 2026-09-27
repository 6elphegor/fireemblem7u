	.include "macro.inc"

	.syntax unified

	thumb_func_start MassEffectDisplay_Check
MassEffectDisplay_Check: @ 0x08032E48
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r7, #0
	adds r5, #0x4c
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl GetTarget
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r6, r0, #0
	ldr r1, _08032E80 @ =0x0203A85C
	ldrb r0, [r4, #2]
	strb r0, [r1, #0xc]
	movs r0, #0
	ldrsh r4, [r5, r0]
	bl CountTargets
	cmp r4, r0
	bne _08032E84
	adds r0, r7, #0
	bl Proc_End
	b _08032ECA
	.align 2, 0
_08032E80: .4byte 0x0203A85C
_08032E84:
	ldr r0, _08032EB0 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08032EB8
	movs r0, #0x11
	ldrsb r0, [r6, r0]
	ldr r1, _08032EB4 @ =0x0202E3EC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08032EB8
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	b _08032ECA
	.align 2, 0
_08032EB0: .4byte 0x0202BBF8
_08032EB4: .4byte 0x0202E3EC
_08032EB8:
	adds r0, r6, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _08032ECA
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
_08032ECA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
