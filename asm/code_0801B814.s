	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801B814
sub_0801B814: @ 0x0801B814
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r4, _0801B890 @ =0x08B857F8
	ldr r1, [r4]
	movs r0, #0x30
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801B8AC
	bl GetGlobalCompletionCount
	adds r5, r0, #0
	ldr r1, [r4]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801B842
	cmp r5, #0
	blt _0801B842
	subs r5, #1
_0801B842:
	ldr r0, _0801B890 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801B856
	cmp r5, #0xb
	bgt _0801B856
	adds r5, #1
_0801B856:
	mov r0, sp
	bl ReadGlobalSaveInfo
	add r1, sp, #0x14
	movs r2, #0
	mov r0, sp
	adds r0, #0x1f
_0801B864:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _0801B864
	movs r4, #0
	cmp r4, r5
	bge _0801B880
_0801B872:
	adds r4, #1
	mov r0, sp
	adds r1, r4, #0
	bl RegisterCompletedPlaythrough
	cmp r4, r5
	blt _0801B872
_0801B880:
	cmp r5, #0
	bne _0801B894
	mov r1, sp
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1, #0xe]
	ands r0, r2
	b _0801B89C
	.align 2, 0
_0801B890: .4byte 0x08B857F8
_0801B894:
	mov r1, sp
	movs r0, #1
	ldrb r2, [r1, #0xe]
	orrs r0, r2
_0801B89C:
	strb r0, [r1, #0xe]
	mov r0, sp
	bl WriteGlobalSaveInfo
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_0801B7A4
_0801B8AC:
	movs r0, #0
	add sp, #0x64
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
