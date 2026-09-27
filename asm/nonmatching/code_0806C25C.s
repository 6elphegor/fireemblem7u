	.include "macro.inc"

	.syntax unified

	thumb_func_start StartPlayMuStepSe
StartPlayMuStepSe: @ 0x0806C25C
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _0806C2AC @ =0x08C9CE70
	adds r0, r1, #0
	bl Proc_Find
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne _0806C284
	ldr r1, _0806C2AC @ =0x08C9CE70
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0xc]
_0806C284:
	ldr r0, [r7, #0xc]
	ldr r1, [r0, #0x58]
	cmp r1, #0
	bne _0806C2B0
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	str r1, [r0, #0x58]
	ldr r1, [r7, #0xc]
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	b _0806C2DA
	.align 2, 0
_0806C2AC: .4byte 0x08C9CE70
_0806C2B0:
	ldr r0, [r7, #0xc]
	ldr r1, [r0, #0x60]
	cmp r1, #0
	bne _0806C2DA
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r1, r1, r2
	str r1, [r0, #0x5c]
	ldr r1, [r7, #0xc]
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x66
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
_0806C2DA:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
