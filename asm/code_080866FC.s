	.include "macro.inc"

	.syntax unified

	thumb_func_start OnMain_SioError
OnMain_SioError: @ 0x080866FC
	push {r4, r5, lr}
	sub sp, #8
	movs r0, #0
	bl InitBgs
	bl m4aSoundInit
	bl Proc_Init
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r5, _080867AC @ =0x03002870
	movs r0, #1
	ldrb r1, [r5, #1]
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	subs r1, #0x10
	ands r0, r1
	subs r1, #0x20
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r5, #1]
	adds r1, r5, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r4, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	movs r0, #0
	bl SetOnHBlankA
	strh r4, [r5, #0x38]
	bl SyncDispIo
	str r4, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r5, _080867B0 @ =0x01000008
	mov r0, sp
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, _080867B4 @ =0x06008000
	adds r2, r5, #0
	bl CpuFastSet
	bl PutSioErrorMessage
	ldr r0, _080867B8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808679C
	movs r0, #0x7b
	bl m4aSongNumStart
_0808679C:
	ldr r0, _080867BC @ =OnMain_SioErrorWait
	bl SetMainFunc
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080867AC: .4byte 0x03002870
_080867B0: .4byte 0x01000008
_080867B4: .4byte 0x06008000
_080867B8: .4byte 0x0202BBF8
_080867BC: .4byte OnMain_SioErrorWait
