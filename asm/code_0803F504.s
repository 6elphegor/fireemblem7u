	.include "macro.inc"

	.syntax unified

	thumb_func_start SioUpdateTeam
SioUpdateTeam: @ 0x0803F504
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	mov sb, r1
	movs r0, #0x81
	bl GetUnit
	mov r8, r0
	mov r4, r8
	movs r6, #4
_0803F51E:
	adds r0, r4, #0
	bl ClearUnit
	adds r4, #0x48
	subs r6, #1
	cmp r6, #0
	bge _0803F51E
	movs r6, #0
	mov r7, r8
_0803F530:
	ldr r0, _0803F580 @ =0x0203E788
	adds r0, r6, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803F55E
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r4, [r5, #0xc]
	movs r0, #8
	ands r4, r0
	cmp r4, #0
	bne _0803F55E
	adds r0, r5, #0
	movs r1, #0
	bl SetUnitStatus
	str r4, [r5, #0xc]
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #0x48
	bl MemCpy
_0803F55E:
	adds r7, #0x48
	adds r6, #1
	cmp r6, #4
	ble _0803F530
	mov r0, sb
	mov r1, r8
	mov r2, sl
	bl WriteMultiArenaSaveTeam
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F580: .4byte 0x0203E788
