	.include "macro.inc"

	.syntax unified

	thumb_func_start TryAddTrapsToTargetList
TryAddTrapsToTargetList: @ 0x08023B60
	push {r4, r5, r6, lr}
	movs r0, #0
	bl GetTrap
	adds r4, r0, #0
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _08023C12
	ldr r6, _08023C18 @ =0x0202E3E0
	ldr r5, _08023C1C @ =0x0202E3E8
_08023B74:
	cmp r0, #2
	bne _08023C0A
	ldrb r1, [r4, #1]
	ldr r0, [r6]
	lsls r3, r1, #2
	adds r0, r3, r0
	ldrb r2, [r4]
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne _08023BA8
	ldr r0, [r5]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08023BA8
	ldrb r3, [r4, #3]
	adds r0, r2, #0
	movs r2, #0
	bl EnlistTarget
_08023BA8:
	ldrb r1, [r4, #1]
	ldr r0, [r6]
	lsls r3, r1, #2
	adds r0, r3, r0
	ldrb r2, [r4]
	ldr r0, [r0, #4]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne _08023BDA
	ldr r0, [r5]
	adds r0, r3, r0
	ldr r0, [r0, #4]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08023BDA
	adds r1, #1
	ldrb r3, [r4, #3]
	adds r0, r2, #0
	movs r2, #0
	bl EnlistTarget
_08023BDA:
	ldrb r1, [r4, #1]
	ldr r0, [r6]
	lsls r3, r1, #2
	adds r0, r3, r0
	ldrb r2, [r4]
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x33
	bne _08023C0A
	ldr r0, [r5]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08023C0A
	ldrb r3, [r4, #3]
	adds r0, r2, #0
	movs r2, #0
	bl EnlistTarget
_08023C0A:
	adds r4, #8
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _08023B74
_08023C12:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08023C18: .4byte 0x0202E3E0
_08023C1C: .4byte 0x0202E3E8
