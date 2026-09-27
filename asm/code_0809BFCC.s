	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809BFCC
sub_0809BFCC: @ 0x0809BFCC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	ldr r2, [r0, #0x34]
	subs r1, r2, #1
	lsls r0, r1, #4
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	movs r1, #0x7e
	subs r1, r1, r0
	movs r0, #0x54
	mov sb, r0
	movs r6, #0
	cmp r6, r2
	bge _0809C028
	ldr r7, _0809C038 @ =0x08CC58D4
	adds r5, r1, #2
	adds r4, r1, #0
_0809BFFA:
	ldr r0, _0809C03C @ =0x0000EF80
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, sb
	adds r3, r7, #0
	bl PutSpriteExt
	ldr r0, _0809C040 @ =0x0000FF80
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sb
	adds r3, r7, #0
	bl PutSpriteExt
	adds r5, #0xf
	adds r4, #0xf
	adds r6, #1
	mov r1, r8
	ldr r0, [r1, #0x34]
	cmp r6, r0
	blt _0809BFFA
_0809C028:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C038: .4byte 0x08CC58D4
_0809C03C: .4byte 0x0000EF80
_0809C040: .4byte 0x0000FF80
