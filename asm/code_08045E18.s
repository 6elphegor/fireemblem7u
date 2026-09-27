	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08045E18
sub_08045E18: @ 0x08045E18
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	bl MuExistsActive
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08045E86
	ldr r4, _08045E90 @ =0x03001400
	ldr r5, _08045E94 @ =0x0203DC9C
	ldrb r1, [r5, #4]
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r6, r0, #0
	ldrb r2, [r5, #5]
	adds r0, r2, r4
	ldrb r0, [r0]
	bl GetUnit
	mov r8, r0
	adds r0, r6, #0
	bl HideUnitSprite
	ldr r1, _08045E98 @ =0x0203A85C
	movs r0, #2
	strb r0, [r1, #0x11]
	ldrb r5, [r5, #5]
	adds r4, r5, r4
	ldrb r0, [r4]
	strb r0, [r1, #0xd]
	ldr r0, _08045E9C @ =0x0300141C
	ldrb r1, [r0, #3]
	adds r0, r6, #0
	bl EquipUnitItemSlot
	adds r0, r6, #0
	mov r1, r8
	bl BattleGenerateReal
	ldr r1, _08045EA0 @ =0x0202BBB8
	movs r0, #0x40
	ldrb r2, [r1, #4]
	orrs r0, r2
	strb r0, [r1, #4]
	ldr r0, _08045EA4 @ =0x08B9A188
	adds r1, r7, #0
	bl Proc_StartBlocking
	adds r0, r7, #0
	bl Proc_Break
_08045E86:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045E90: .4byte 0x03001400
_08045E94: .4byte 0x0203DC9C
_08045E98: .4byte 0x0203A85C
_08045E9C: .4byte 0x0300141C
_08045EA0: .4byte 0x0202BBB8
_08045EA4: .4byte 0x08B9A188
