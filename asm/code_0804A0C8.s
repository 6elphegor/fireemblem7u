	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearUiItemHover
ClearUiItemHover: @ 0x0804A0C8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r3, r0, #0
	adds r4, r1, #0
	mov sb, r2
	adds r0, r3, r2
	subs r5, r0, #1
	adds r4, #1
	ldr r0, _0804A128 @ =0x02023460
	mov r8, r0
	ldr r1, _0804A12C @ =0x081D581C
	mov ip, r1
	cmp r3, r5
	bge _0804A10C
	lsls r0, r4, #5
	ldrh r7, [r1, #0xc]
	adds r0, #1
	ldrh r6, [r1, #0xe]
	lsls r2, r3, #1
	lsls r1, r4, #6
	add r1, r8
	adds r1, r2, r1
	lsls r0, r0, #1
	add r0, r8
	adds r2, r2, r0
_0804A0FE:
	strh r7, [r1]
	strh r6, [r2]
	adds r1, #4
	adds r2, #4
	adds r3, #2
	cmp r3, r5
	blt _0804A0FE
_0804A10C:
	lsls r0, r4, #5
	adds r0, r0, r5
	lsls r0, r0, #1
	mov r2, r8
	adds r1, r0, r2
	movs r0, #1
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _0804A130
	mov r2, ip
	ldrh r0, [r2, #0xc]
	b _0804A134
	.align 2, 0
_0804A128: .4byte 0x02023460
_0804A12C: .4byte 0x081D581C
_0804A130:
	mov r2, ip
	ldrh r0, [r2, #0xe]
_0804A134:
	strh r0, [r1]
	movs r0, #2
	bl EnableBgSync
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
