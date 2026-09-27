	.include "macro.inc"

	.syntax unified

	thumb_func_start EnsureCameraOntoCenteredPosition
EnsureCameraOntoCenteredPosition: @ 0x08015C58
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	add r3, sp, #4
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, sp
	bl StoreAdjustedCameraPositions
	ldr r1, [sp]
	lsls r1, r1, #4
	str r1, [sp]
	ldr r0, [sp, #4]
	lsls r2, r0, #4
	str r2, [sp, #4]
	ldr r3, _08015C9C @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r0, [r3, r4]
	cmp r1, r0
	bne _08015C8C
	movs r1, #0xe
	ldrsh r0, [r3, r1]
	cmp r2, r0
	beq _08015C98
_08015C8C:
	ldr r4, _08015CA0 @ =0x08B92E38
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _08015CA4
_08015C98:
	movs r0, #0
	b _08015CD4
	.align 2, 0
_08015C9C: .4byte 0x0202BBB8
_08015CA0: .4byte 0x08B92E38
_08015CA4:
	cmp r5, #0
	beq _08015CB2
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_StartBlocking
	b _08015CBA
_08015CB2:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
_08015CBA:
	adds r2, r0, #0
	ldr r1, _08015CDC @ =0x0202BBB8
	ldrh r0, [r1, #0xc]
	strh r0, [r2, #0x30]
	ldrh r0, [r1, #0xe]
	strh r0, [r2, #0x32]
	ldr r0, [sp]
	strh r0, [r2, #0x2c]
	ldr r0, [sp, #4]
	strh r0, [r2, #0x2e]
	strh r6, [r2, #0x34]
	strh r7, [r2, #0x36]
	movs r0, #1
_08015CD4:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08015CDC: .4byte 0x0202BBB8
