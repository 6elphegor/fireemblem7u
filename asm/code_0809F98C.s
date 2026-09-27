	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearPidChStatsSaveData
ClearPidChStatsSaveData: @ 0x0809F98C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	mov r0, sp
	movs r4, #0
	strh r4, [r0]
	ldr r5, _0809FA14 @ =0x0203E7A0
	ldr r2, _0809FA18 @ =0x01000230
	adds r1, r5, #0
	bl CpuSet
	mov r0, sp
	adds r0, #2
	strh r4, [r0]
	ldr r1, _0809FA1C @ =0x0203EC00
	ldr r2, _0809FA20 @ =0x01000060
	bl CpuSet
	adds r7, r5, #0
	movs r6, #0x86
	lsls r6, r6, #4
	add r6, r8
	adds r4, r7, #0
	movs r5, #0x45
_0809F9C0:
	ldr r0, [r4]
	ldr r1, _0809FA24 @ =0xFF0000FF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r4]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x10
	bl WriteAndVerifySramFast
	adds r6, #0x10
	adds r4, #0x10
	subs r5, #1
	cmp r5, #0
	bge _0809F9C0
	movs r4, #0xcc
	lsls r4, r4, #4
	add r4, r8
	movs r5, #0x2f
_0809F9EA:
	ldr r0, _0809FA1C @ =0x0203EC00
	adds r1, r4, #0
	movs r2, #4
	bl WriteAndVerifySramFast
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge _0809F9EA
	ldr r1, _0809FA28 @ =0x0203E79C
	movs r0, #0x86
	lsls r0, r0, #4
	add r0, r8
	str r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809FA14: .4byte 0x0203E7A0
_0809FA18: .4byte 0x01000230
_0809FA1C: .4byte 0x0203EC00
_0809FA20: .4byte 0x01000060
_0809FA24: .4byte 0xFF0000FF
_0809FA28: .4byte 0x0203E79C
