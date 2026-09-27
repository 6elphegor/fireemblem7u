	.include "macro.inc"

	.syntax unified

	thumb_func_start ActionSupport
ActionSupport: @ 0x0802F540
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0802F5E0 @ =0x0203A85C
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, _0802F5E4 @ =0x03004690
	mov sb, r0
	ldr r0, [r0]
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	bl GetUnitSupportNumByPid
	adds r7, r0, #0
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	ldrb r1, [r0, #4]
	adds r0, r4, #0
	bl GetUnitSupportNumByPid
	mov r8, r0
	adds r0, r4, #0
	mov r1, r8
	bl CanUnitSupportNow
	mov r2, sb
	ldr r0, [r2]
	adds r1, r7, #0
	bl UnitGainSupportLevel
	adds r0, r4, #0
	mov r1, r8
	bl UnitGainSupportLevel
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r0]
	ldrb r6, [r1, #4]
	ldr r1, [r4]
	ldrb r5, [r1, #4]
	adds r1, r7, #0
	bl GetUnitSupportLevel
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl StartSupportTalk
	mov r2, sb
	ldr r0, [r2]
	adds r0, #0x32
	adds r0, r0, r7
	ldrb r0, [r0]
	adds r4, #0x32
	add r4, r8
	ldrb r1, [r4]
	cmp r0, r1
	beq _0802F5D0
	cmp r0, r1
	ble _0802F5C2
	strb r0, [r4]
_0802F5C2:
	cmp r0, r1
	bge _0802F5D0
	mov r2, sb
	ldr r0, [r2]
	adds r0, #0x32
	adds r0, r0, r7
	strb r1, [r0]
_0802F5D0:
	movs r0, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802F5E0: .4byte 0x0203A85C
_0802F5E4: .4byte 0x03004690
