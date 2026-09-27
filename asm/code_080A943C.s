	.include "macro.inc"

	.syntax unified

	thumb_func_start SysHandCursor_Loop
SysHandCursor_Loop: @ 0x080A943C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl PutUiHand
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080A945C
	adds r0, r4, #0
	bl DisplayExtendedSysHand
_080A945C:
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080A9474
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	adds r1, #2
	bl DisplayBmTextShadow
_080A9474:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
