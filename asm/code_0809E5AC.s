	.include "macro.inc"

	.syntax unified

	thumb_func_start InitGlobalSaveInfo
InitGlobalSaveInfo: @ 0x0809E5AC
	push {r4, lr}
	sub sp, #0x64
	bl WipeSram
	ldr r1, _0809E678 @ =0x0840F430
	mov r0, sp
	bl StringCopy
	ldr r0, _0809E67C @ =0x00030317
	str r0, [sp, #8]
	mov r1, sp
	movs r3, #0
	ldr r0, _0809E680 @ =0x0000200A
	strh r0, [r1, #0xc]
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1, #0xe]
	ands r0, r2
	strb r0, [r1, #0xe]
	mov r2, sp
	movs r1, #3
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r2, #0xe]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0xe]
	movs r1, #9
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r2, #0xe]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0xe]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r2, #0xe]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0xe]
	mov r1, sp
	movs r0, #0
	strb r0, [r1, #0xe]
	mov r0, sp
	strb r3, [r0, #0xf]
	strb r3, [r0, #0x10]
	ldr r0, [sp, #0x10]
	ldr r1, _0809E684 @ =0xFF0000FF
	ands r0, r1
	str r0, [sp, #0x10]
	mov r0, sp
	adds r0, #0x63
	strb r3, [r0]
	subs r0, #1
	strb r3, [r0]
	mov r1, sp
	movs r0, #0x20
	rsbs r0, r0, #0
	ldrb r2, [r1, #0x13]
	ands r0, r2
	strb r0, [r1, #0x13]
	movs r0, #0
	bl SetLang
	add r3, sp, #0x20
	add r4, sp, #0x40
	add r1, sp, #0x14
	movs r2, #0
	mov r0, sp
	adds r0, #0x1f
_0809E640:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _0809E640
	adds r1, r3, #0
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x1f
_0809E650:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _0809E650
	adds r1, r4, #0
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x1f
_0809E660:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _0809E660
	mov r0, sp
	bl WriteGlobalSaveInfo
	add sp, #0x64
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809E678: .4byte 0x0840F430
_0809E67C: .4byte 0x00030317
_0809E680: .4byte 0x0000200A
_0809E684: .4byte 0xFF0000FF
