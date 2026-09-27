	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitSupportUnit
GetUnitSupportUnit: @ 0x0802664C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl GetUnitSupportPid
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r0, #0xc0
	ldrb r4, [r4, #0xb]
	ands r0, r4
	adds r5, r0, #1
	adds r6, r0, #0
	adds r6, #0x40
	cmp r5, r6
	bge _0802668A
_08026668:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08026684
	ldr r0, [r4]
	cmp r0, #0
	beq _08026684
	ldrb r0, [r0, #4]
	cmp r0, r7
	bne _08026684
	adds r0, r4, #0
	b _0802668C
_08026684:
	adds r5, #1
	cmp r5, r6
	blt _08026668
_0802668A:
	movs r0, #0
_0802668C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
